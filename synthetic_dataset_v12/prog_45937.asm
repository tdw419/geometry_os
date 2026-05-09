; DESCRIPTION: Places a yellow line segment connecting (449, 184) to (175, 234).
; PLAN: r0=449(x1), r1=184(y1), r2=175(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 184
LDI r2, 175
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
