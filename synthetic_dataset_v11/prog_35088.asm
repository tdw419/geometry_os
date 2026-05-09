; DESCRIPTION: Places a yellow line segment connecting (99, 156) to (52, 27).
; PLAN: r0=99(x1), r1=156(y1), r2=52(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 156
LDI r2, 52
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
