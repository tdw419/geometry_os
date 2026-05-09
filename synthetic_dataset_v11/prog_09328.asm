; DESCRIPTION: Renders a yellow line between points (231, 58) and (46, 110).
; PLAN: r0=231(x1), r1=58(y1), r2=46(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 58
LDI r2, 46
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
