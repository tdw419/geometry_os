; DESCRIPTION: Renders a green rectangular region spanning 35 by 51 at (186, 113).
; PLAN: r0=186(x), r1=113(y), r2=35(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 113
LDI r2, 35
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
