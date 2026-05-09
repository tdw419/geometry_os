; DESCRIPTION: Places a yellow line segment connecting (454, 86) to (264, 239).
; PLAN: r0=454(x1), r1=86(y1), r2=264(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 86
LDI r2, 264
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
