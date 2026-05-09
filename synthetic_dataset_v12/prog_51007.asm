; DESCRIPTION: Renders a purple line between points (221, 106) and (126, 236).
; PLAN: r0=221(x1), r1=106(y1), r2=126(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 106
LDI r2, 126
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
