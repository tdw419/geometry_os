; DESCRIPTION: Draws a yellow rectangle at (204, 199) with width 27 and height 12.
; PLAN: r0=204(x), r1=199(y), r2=27(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 199
LDI r2, 27
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
