; DESCRIPTION: Draws a yellow rectangle at (186, 94) with width 30 and height 51.
; PLAN: r0=186(x), r1=94(y), r2=30(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 94
LDI r2, 30
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
