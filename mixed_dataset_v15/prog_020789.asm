; DESCRIPTION: Draws a purple line from (29, 2) to (399, 42).
; PLAN: r0=29(x1), r1=2(y1), r2=399(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 2
LDI r2, 399
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
