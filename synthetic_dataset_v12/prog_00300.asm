; DESCRIPTION: Draws a yellow line from (227, 13) to (290, 231).
; PLAN: r0=227(x1), r1=13(y1), r2=290(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 13
LDI r2, 290
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
