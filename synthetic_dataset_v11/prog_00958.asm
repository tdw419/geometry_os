; DESCRIPTION: Places a yellow line segment connecting (9, 63) to (205, 209).
; PLAN: r0=9(x1), r1=63(y1), r2=205(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 63
LDI r2, 205
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
