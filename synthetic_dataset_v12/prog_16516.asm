; DESCRIPTION: Renders a yellow line between points (125, 215) and (476, 136).
; PLAN: r0=125(x1), r1=215(y1), r2=476(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 215
LDI r2, 476
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
