; DESCRIPTION: Draws a purple line from (95, 184) to (170, 42).
; PLAN: r0=95(x1), r1=184(y1), r2=170(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 184
LDI r2, 170
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
