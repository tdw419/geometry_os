; DESCRIPTION: Places a yellow line segment connecting (398, 10) to (421, 144).
; PLAN: r0=398(x1), r1=10(y1), r2=421(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 10
LDI r2, 421
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
