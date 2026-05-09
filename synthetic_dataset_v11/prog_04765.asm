; DESCRIPTION: Draws a black line from (36, 231) to (101, 109).
; PLAN: r0=36(x1), r1=231(y1), r2=101(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 231
LDI r2, 101
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
