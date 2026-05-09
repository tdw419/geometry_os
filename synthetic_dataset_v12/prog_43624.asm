; DESCRIPTION: Renders a purple line between points (45, 76) and (392, 195).
; PLAN: r0=45(x1), r1=76(y1), r2=392(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 76
LDI r2, 392
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
