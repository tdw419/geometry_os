; DESCRIPTION: Draws a yellow rectangle at (126, 37) with width 34 and height 77.
; PLAN: r0=126(x), r1=37(y), r2=34(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 37
LDI r2, 34
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
