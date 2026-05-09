; DESCRIPTION: Draws a black line from (154, 142) to (311, 130).
; PLAN: r0=154(x1), r1=142(y1), r2=311(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 142
LDI r2, 311
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
