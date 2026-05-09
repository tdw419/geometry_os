; DESCRIPTION: Draws a blue line from (119, 52) to (118, 42).
; PLAN: r0=119(x1), r1=52(y1), r2=118(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 52
LDI r2, 118
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
