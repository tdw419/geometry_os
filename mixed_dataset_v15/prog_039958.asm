; DESCRIPTION: Draws a red line from (175, 99) to (253, 45).
; PLAN: r0=175(x1), r1=99(y1), r2=253(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 99
LDI r2, 253
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
