; DESCRIPTION: Places a yellow line segment connecting (23, 253) to (135, 72).
; PLAN: r0=23(x1), r1=253(y1), r2=135(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 253
LDI r2, 135
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
