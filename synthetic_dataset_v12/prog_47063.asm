; DESCRIPTION: Draws a yellow rectangle at (209, 26) with width 77 and height 105.
; PLAN: r0=209(x), r1=26(y), r2=77(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 26
LDI r2, 77
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
