; DESCRIPTION: Places a black line segment connecting (280, 225) to (293, 92).
; PLAN: r0=280(x1), r1=225(y1), r2=293(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 225
LDI r2, 293
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
