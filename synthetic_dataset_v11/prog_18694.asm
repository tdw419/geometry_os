; DESCRIPTION: Places a yellow line segment connecting (46, 249) to (211, 249).
; PLAN: r0=46(x1), r1=249(y1), r2=211(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 249
LDI r2, 211
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
