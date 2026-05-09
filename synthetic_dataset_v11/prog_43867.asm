; DESCRIPTION: Draws a purple line from (191, 10) to (13, 42).
; PLAN: r0=191(x1), r1=10(y1), r2=13(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 10
LDI r2, 13
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
