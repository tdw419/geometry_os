; DESCRIPTION: Renders a purple line between points (280, 254) and (362, 72).
; PLAN: r0=280(x1), r1=254(y1), r2=362(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 254
LDI r2, 362
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
