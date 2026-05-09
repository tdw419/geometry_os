; DESCRIPTION: Draws a purple line from (145, 154) to (36, 128).
; PLAN: r0=145(x1), r1=154(y1), r2=36(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 154
LDI r2, 36
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
