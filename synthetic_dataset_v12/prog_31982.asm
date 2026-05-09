; DESCRIPTION: Draws a purple line from (476, 226) to (157, 213).
; PLAN: r0=476(x1), r1=226(y1), r2=157(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 226
LDI r2, 157
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
