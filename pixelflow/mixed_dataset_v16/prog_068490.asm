; DESCRIPTION: Draws a purple line from (297, 132) to (106, 213).
; PLAN: r0=297(x1), r1=132(y1), r2=106(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 132
LDI r2, 106
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
