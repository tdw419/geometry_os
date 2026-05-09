; DESCRIPTION: Draws a purple line from (19, 223) to (158, 42).
; PLAN: r0=19(x1), r1=223(y1), r2=158(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 223
LDI r2, 158
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
