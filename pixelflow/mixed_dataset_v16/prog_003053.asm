; DESCRIPTION: Draws a yellow rectangle at (228, 174) with width 105 and height 11.
; PLAN: r0=228(x), r1=174(y), r2=105(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 174
LDI r2, 105
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
