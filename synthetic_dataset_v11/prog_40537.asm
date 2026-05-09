; DESCRIPTION: Draws a yellow line from (89, 9) to (225, 234).
; PLAN: r0=89(x1), r1=9(y1), r2=225(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 9
LDI r2, 225
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
