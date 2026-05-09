; DESCRIPTION: Draws a yellow rectangle at (363, 167) with width 10 and height 37.
; PLAN: r0=363(x), r1=167(y), r2=10(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 167
LDI r2, 10
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
