; DESCRIPTION: Draws a blue rectangle at (406, 161) with width 64 and height 75.
; PLAN: r0=406(x), r1=161(y), r2=64(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 161
LDI r2, 64
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
