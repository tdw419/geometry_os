; DESCRIPTION: Renders a green line between points (504, 231) and (147, 99).
; PLAN: r0=504(x1), r1=231(y1), r2=147(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 231
LDI r2, 147
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
