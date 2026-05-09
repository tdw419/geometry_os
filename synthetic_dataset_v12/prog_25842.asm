; DESCRIPTION: Draws a purple line from (228, 54) to (325, 247).
; PLAN: r0=228(x1), r1=54(y1), r2=325(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 54
LDI r2, 325
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
