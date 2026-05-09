; DESCRIPTION: Draws a green rectangle at (54, 90) with width 33 and height 64.
; PLAN: r0=54(x), r1=90(y), r2=33(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 90
LDI r2, 33
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
