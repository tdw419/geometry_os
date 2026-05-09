; DESCRIPTION: Places a yellow line segment connecting (83, 65) to (229, 6).
; PLAN: r0=83(x1), r1=65(y1), r2=229(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 65
LDI r2, 229
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
