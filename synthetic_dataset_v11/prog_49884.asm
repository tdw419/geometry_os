; DESCRIPTION: Draws a purple line from (145, 44) to (126, 187).
; PLAN: r0=145(x1), r1=44(y1), r2=126(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 44
LDI r2, 126
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
