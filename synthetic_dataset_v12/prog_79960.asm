; DESCRIPTION: Renders a green line between points (476, 150) and (133, 135).
; PLAN: r0=476(x1), r1=150(y1), r2=133(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 150
LDI r2, 133
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
