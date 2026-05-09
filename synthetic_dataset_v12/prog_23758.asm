; DESCRIPTION: Renders a purple line between points (333, 178) and (141, 195).
; PLAN: r0=333(x1), r1=178(y1), r2=141(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 178
LDI r2, 141
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
