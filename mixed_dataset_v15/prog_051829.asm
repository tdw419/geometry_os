; DESCRIPTION: Renders a yellow line between points (290, 222) and (41, 231).
; PLAN: r0=290(x1), r1=222(y1), r2=41(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 222
LDI r2, 41
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
