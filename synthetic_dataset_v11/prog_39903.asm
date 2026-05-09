; DESCRIPTION: Draws a purple line from (103, 79) to (27, 245).
; PLAN: r0=103(x1), r1=79(y1), r2=27(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 79
LDI r2, 27
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
