; DESCRIPTION: Draws a yellow rectangle at (332, 172) with width 98 and height 77.
; PLAN: r0=332(x), r1=172(y), r2=98(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 172
LDI r2, 98
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
