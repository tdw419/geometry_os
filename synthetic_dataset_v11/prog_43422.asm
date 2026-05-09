; DESCRIPTION: Renders a yellow line between points (20, 253) and (31, 231).
; PLAN: r0=20(x1), r1=253(y1), r2=31(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 253
LDI r2, 31
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
