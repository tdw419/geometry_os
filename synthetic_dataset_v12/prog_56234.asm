; DESCRIPTION: Renders a purple line between points (87, 214) and (396, 197).
; PLAN: r0=87(x1), r1=214(y1), r2=396(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 214
LDI r2, 396
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
