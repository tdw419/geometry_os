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

LDI r14, 1              ; increment constant
LDI r0, 256            ; screen width
LDI r11, 0              ; frame counter

; Clear screen to dark blue
LDI r5, 0x000033
FILL r5

; Draw title bar
LDI r5, 0x00
LDI r8, 0
LDI r1, 256
LDI r13, 1
LDI r4, 0x333333
RECTF r5, r8, r1, r13, r4

; Draw status bar at bottom
LDI r5, 0
LDI r8, 250
LDI r1, 256
LDI r13, 6
LDI r4, 0x222222
RECTF r5, r8, r1, r13, r4

; Write "Pixel Chat - Waiting..." text at top
LDI r2, 0x2000
LDI r9, 80             ; 'P'
STORE r2, r9
LDI r2, 0x2001
LDI r9, 105            ; 'i'
STORE r2, r9
LDI r2, 0x2002
LDI r9, 120            ; 'x'
STORE r2, r9
LDI r2, 0x2003
LDI r9, 101            ; 'e'
STORE r2, r9
LDI r2, 0x2004
LDI r9, 108            ; 'l'
STORE r2, r9
LDI r2, 0x2005
LDI r9, 0              ; null
STORE r2, r9

LDI r2, 0x2000
LDI r9, 2
LDI r3, 8
LDI r7, 0xFFFFFF
TEXT r2, r9, r7

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r11, r14
  LDI r5, 0xFFE
  STORE r5, r11

  ; Poll NET_RECV
  LDI r5, 0x7100     ; receive buffer
  LDI r8, 256        ; max length
  NET_RECV r5, r8

  ; Check if we got data (r6 > 0 means data received)
  LDI r1, 0
  CMP r6, r1
  JZ r6, no_data

  ; Data received! Check frame type
  LDI r13, 0x7100
  LOAD r13, r13         ; r13 = frame type
  LDI r4, 1
  CMP r13, r4
  JZ r6, got_chat       ; type 1 = chat message

  ; Type 0 = screen share - display pixels
  ; Pixel data starts at 0x7104 (after 4-byte header)
  ; For now, just flash the screen green briefly
  LDI r5, 0x003300
  FILL r5
  FRAME
  JMP main_loop

got_chat:
  ; Chat message received - display in status bar
  ; Change status bar color to indicate message
  LDI r5, 0
  LDI r8, 250
  LDI r1, 256
  LDI r13, 6
  LDI r4, 0x004400    ; green tint = message received
  RECTF r5, r8, r1, r13, r4
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r5, 0xFFE
  LOAD r5, r5         ; r5 = TICKS
  LDI r8, 30
  AND r5, r8          ; r5 = TICKS & 30
  LDI r8, 15
  CMP r5, r8
  BLT r6, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r5, 128
  LDI r8, 4
  LDI r1, 0x000000
  PSET r5, r8, r1
  FRAME
  JMP main_loop

dot_on:
  LDI r5, 128
  LDI r8, 4
  LDI r1, 0xFFFFFF
  PSET r5, r8, r1
  FRAME
  JMP main_loop

HALT
