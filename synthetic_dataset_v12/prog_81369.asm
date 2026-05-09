; DESCRIPTION: Places a yellow line segment connecting (281, 234) to (396, 43).
; PLAN: r0=281(x1), r1=234(y1), r2=396(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 234
LDI r2, 396
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
