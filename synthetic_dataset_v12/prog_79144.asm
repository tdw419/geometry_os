; DESCRIPTION: Renders a blue line between points (282, 121) and (316, 166).
; PLAN: r0=282(x1), r1=121(y1), r2=316(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 121
LDI r2, 316
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
