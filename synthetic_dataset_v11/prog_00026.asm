; DESCRIPTION: Draws a green rectangle at (204, 52) with width 27 and height 107.
; PLAN: r0=204(x), r1=52(y), r2=27(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 52
LDI r2, 27
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
