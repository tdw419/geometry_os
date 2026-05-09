; DESCRIPTION: Places a yellow line segment connecting (126, 5) to (250, 234).
; PLAN: r0=126(x1), r1=5(y1), r2=250(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 5
LDI r2, 250
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
