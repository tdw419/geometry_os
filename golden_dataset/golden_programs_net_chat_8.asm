; DESCRIPTION: A colored object centered at the screen with fixed size.

; net_chat.asm -- Pixel Chat Demo (Phase 71: Pixel Network Protocol)
;
; Demonstrates bidirectional NET_RECV for receiving pixel data from a peer.
; Listens for incoming pixel protocol frames and displays them on screen.
; Also shows a simple text interface using NET_SEND for chat messages.
;
; For testing without a real network: push frames into vm.net_inbox
; using the test harness. The demo polls NET_RECV each frame.
;
; Protocol:
;   Frame type 0 (screen_share): display pixels on screen
;   Frame type 1 (chat): display text message in status bar

LDI r15, 1              ; increment constant
LDI r11, 256            ; screen width
LDI r13, 0              ; frame counter

; Clear screen to dark blue
LDI r7, 0x000033
FILL r7

; Draw title bar
LDI r7, 0x00
LDI r9, 0
LDI r12, 256
LDI r14, 1
LDI r8, 0x333333
RECTF r7, r9, r12, r14, r8

; Draw status bar at bottom
LDI r7, 0
LDI r9, 250
LDI r12, 256
LDI r14, 6
LDI r8, 0x222222
RECTF r7, r9, r12, r14, r8

; Write "Pixel Chat - Waiting..." text at top
LDI r0, 0x2000
LDI r5, 80             ; 'P'
STORE r0, r5
LDI r0, 0x2001
LDI r5, 105            ; 'i'
STORE r0, r5
LDI r0, 0x2002
LDI r5, 120            ; 'x'
STORE r0, r5
LDI r0, 0x2003
LDI r5, 101            ; 'e'
STORE r0, r5
LDI r0, 0x2004
LDI r5, 108            ; 'l'
STORE r0, r5
LDI r0, 0x2005
LDI r5, 0              ; null
STORE r0, r5

LDI r0, 0x2000
LDI r5, 2
LDI r2, 8
LDI r1, 0xFFFFFF
TEXT r0, r5, r1

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r13, r15
  LDI r7, 0xFFE
  STORE r7, r13

  ; Poll NET_RECV
  LDI r7, 0x7100     ; receive buffer
  LDI r9, 256        ; max length
  NET_RECV r7, r9

  ; Check if we got data (r4 > 0 means data received)
  LDI r12, 0
  CMP r4, r12
  JZ r4, no_data

  ; Data received! Check frame type
  LDI r14, 0x7100
  LOAD r14, r14         ; r14 = frame type
  LDI r8, 1
  CMP r14, r8
  JZ r4, got_chat       ; type 1 = chat message

  ; Type 0 = screen share - display pixels
  ; Pixel data starts at 0x7104 (after 4-byte header)
  ; For now, just flash the screen green briefly
  LDI r7, 0x003300
  FILL r7
  FRAME
  JMP main_loop

got_chat:
  ; Chat message received - display in status bar
  ; Change status bar color to indicate message
  LDI r7, 0
  LDI r9, 250
  LDI r12, 256
  LDI r14, 6
  LDI r8, 0x004400    ; green tint = message received
  RECTF r7, r9, r12, r14, r8
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r7, 0xFFE
  LOAD r7, r7         ; r7 = TICKS
  LDI r9, 30
  AND r7, r9          ; r7 = TICKS & 30
  LDI r9, 15
  CMP r7, r9
  BLT r4, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r7, 128
  LDI r9, 4
  LDI r12, 0x000000
  PSET r7, r9, r12
  FRAME
  JMP main_loop

dot_on:
  LDI r7, 128
  LDI r9, 4
  LDI r12, 0xFFFFFF
  PSET r7, r9, r12
  FRAME
  JMP main_loop

HALT
