; DESCRIPTION: Draws a purple line from (438, 64) to (309, 107).
; PLAN: r0=438(x1), r1=64(y1), r2=309(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 64
LDI r2, 309
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
