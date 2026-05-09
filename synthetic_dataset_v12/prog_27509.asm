; DESCRIPTION: Places a purple line segment connecting (140, 188) to (176, 107).
; PLAN: r0=140(x1), r1=188(y1), r2=176(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 188
LDI r2, 176
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
