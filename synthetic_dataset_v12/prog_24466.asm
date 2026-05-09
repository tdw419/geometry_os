; DESCRIPTION: Draws a purple line from (226, 187) to (48, 49).
; PLAN: r0=226(x1), r1=187(y1), r2=48(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 187
LDI r2, 48
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
