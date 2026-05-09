; DESCRIPTION: Draws a red line from (8, 62) to (101, 142).
; PLAN: r0=8(x1), r1=62(y1), r2=101(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 62
LDI r2, 101
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
