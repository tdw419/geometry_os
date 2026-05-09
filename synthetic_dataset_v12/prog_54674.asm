; DESCRIPTION: Renders a purple line between points (309, 191) and (198, 236).
; PLAN: r0=309(x1), r1=191(y1), r2=198(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 191
LDI r2, 198
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
