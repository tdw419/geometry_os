; DESCRIPTION: Places a black line segment connecting (280, 65) to (495, 60).
; PLAN: r0=280(x1), r1=65(y1), r2=495(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 65
LDI r2, 495
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
