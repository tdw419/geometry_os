; DESCRIPTION: Draws a magenta rectangle at (406, 230) with width 21 and height 16.
; PLAN: r0=406(x), r1=230(y), r2=21(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 230
LDI r2, 21
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
