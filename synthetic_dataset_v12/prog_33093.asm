; DESCRIPTION: Places a white line segment connecting (279, 240) to (45, 2).
; PLAN: r0=279(x1), r1=240(y1), r2=45(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 240
LDI r2, 45
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
