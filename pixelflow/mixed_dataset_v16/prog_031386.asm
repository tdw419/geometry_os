; DESCRIPTION: Draws a blue line from (101, 253) to (115, 54).
; PLAN: r0=101(x1), r1=253(y1), r2=115(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 253
LDI r2, 115
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
