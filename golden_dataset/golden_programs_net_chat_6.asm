; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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

LDI r1, 1              ; increment constant
LDI r8, 256            ; screen width
LDI r11, 0              ; frame counter

; Clear screen to dark blue
LDI r14, 0x000033
FILL r14

; Draw title bar
LDI r14, 0x00
LDI r5, 0
LDI r0, 256
LDI r13, 1
LDI r15, 0x333333
RECTF r14, r5, r0, r13, r15

; Draw status bar at bottom
LDI r14, 0
LDI r5, 250
LDI r0, 256
LDI r13, 6
LDI r15, 0x222222
RECTF r14, r5, r0, r13, r15

; Write "Pixel Chat - Waiting..." text at top
LDI r9, 0x2000
LDI r3, 80             ; 'P'
STORE r9, r3
LDI r9, 0x2001
LDI r3, 105            ; 'i'
STORE r9, r3
LDI r9, 0x2002
LDI r3, 120            ; 'x'
STORE r9, r3
LDI r9, 0x2003
LDI r3, 101            ; 'e'
STORE r9, r3
LDI r9, 0x2004
LDI r3, 108            ; 'l'
STORE r9, r3
LDI r9, 0x2005
LDI r3, 0              ; null
STORE r9, r3

LDI r9, 0x2000
LDI r3, 2
LDI r2, 8
LDI r12, 0xFFFFFF
TEXT r9, r3, r12

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r11, r1
  LDI r14, 0xFFE
  STORE r14, r11

  ; Poll NET_RECV
  LDI r14, 0x7100     ; receive buffer
  LDI r5, 256        ; max length
  NET_RECV r14, r5

  ; Check if we got data (r10 > 0 means data received)
  LDI r0, 0
  CMP r10, r0
  JZ r10, no_data

  ; Data received! Check frame type
  LDI r13, 0x7100
  LOAD r13, r13         ; r13 = frame type
  LDI r15, 1
  CMP r13, r15
  JZ r10, got_chat       ; type 1 = chat message

  ; Type 0 = screen share - display pixels
  ; Pixel data starts at 0x7104 (after 4-byte header)
  ; For now, just flash the screen green briefly
  LDI r14, 0x003300
  FILL r14
  FRAME
  JMP main_loop

got_chat:
  ; Chat message received - display in status bar
  ; Change status bar color to indicate message
  LDI r14, 0
  LDI r5, 250
  LDI r0, 256
  LDI r13, 6
  LDI r15, 0x004400    ; green tint = message received
  RECTF r14, r5, r0, r13, r15
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r14, 0xFFE
  LOAD r14, r14         ; r14 = TICKS
  LDI r5, 30
  AND r14, r5          ; r14 = TICKS & 30
  LDI r5, 15
  CMP r14, r5
  BLT r10, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r14, 128
  LDI r5, 4
  LDI r0, 0x000000
  PSET r14, r5, r0
  FRAME
  JMP main_loop

dot_on:
  LDI r14, 128
  LDI r5, 4
  LDI r0, 0xFFFFFF
  PSET r14, r5, r0
  FRAME
  JMP main_loop

HALT
