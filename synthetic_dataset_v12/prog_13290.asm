; DESCRIPTION: Places a yellow line segment connecting (214, 156) to (509, 66).
; PLAN: r0=214(x1), r1=156(y1), r2=509(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 156
LDI r2, 509
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
