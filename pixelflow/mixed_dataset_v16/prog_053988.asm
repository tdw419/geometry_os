; DESCRIPTION: Draws a yellow line from (8, 91) to (507, 150).
; PLAN: r0=8(x1), r1=91(y1), r2=507(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 91
LDI r2, 507
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
