; DESCRIPTION: Renders a purple line between points (308, 74) and (181, 125).
; PLAN: r0=308(x1), r1=74(y1), r2=181(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 74
LDI r2, 181
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
