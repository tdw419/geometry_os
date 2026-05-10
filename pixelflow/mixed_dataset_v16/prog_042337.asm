; DESCRIPTION: Draws a black rectangle at (192, 80) with width 96 and height 50.
; PLAN: r0=192(x), r1=80(y), r2=96(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 80
LDI r2, 96
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
