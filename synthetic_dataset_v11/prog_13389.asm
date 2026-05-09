; DESCRIPTION: Draws a yellow rectangle at (124, 9) with width 98 and height 107.
; PLAN: r0=124(x), r1=9(y), r2=98(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 9
LDI r2, 98
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
