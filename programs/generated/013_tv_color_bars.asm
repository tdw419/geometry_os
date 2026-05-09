; COLOR BARS -- Classic TV test pattern with vertical color bars
; 8 bars of equal width (32px each), cycling through colors

; Bar width = 32
LDI r5, 32
; y = 0, height = 256
LDI r1, 0
LDI r3, 256

; White bar at x=0
LDI r0, 0
LDI r4, 0xFFFFFF
LDI r6, 0
ADD r6, r4
RECTF r0, r1, r5, r3, r6

; Yellow bar at x=32
LDI r0, 32
LDI r4, 0xFFFF00
LDI r6, 0
ADD r6, r4
RECTF r0, r1, r5, r3, r6

; Cyan bar at x=64
LDI r0, 64
LDI r4, 0x00FFFF
LDI r6, 0
ADD r6, r4
RECTF r0, r1, r5, r3, r6

; Green bar at x=96
LDI r0, 96
LDI r4, 0x00FF00
LDI r6, 0
ADD r6, r4
RECTF r0, r1, r5, r3, r6

; Magenta bar at x=128
LDI r0, 128
LDI r4, 0xFF00FF
LDI r6, 0
ADD r6, r4
RECTF r0, r1, r5, r3, r6

; Red bar at x=160
LDI r0, 160
LDI r4, 0xFF0000
LDI r6, 0
ADD r6, r4
RECTF r0, r1, r5, r3, r6

; Blue bar at x=192
LDI r0, 192
LDI r4, 0x0000FF
LDI r6, 0
ADD r6, r4
RECTF r0, r1, r5, r3, r6

; Black bar at x=224
LDI r0, 224
LDI r4, 0x000000
LDI r6, 0
ADD r6, r4
RECTF r0, r1, r5, r3, r6

HALT
