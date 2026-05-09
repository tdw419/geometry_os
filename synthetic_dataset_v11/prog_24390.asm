; DESCRIPTION: Places a black line segment connecting (135, 87) to (111, 99).
; PLAN: r0=135(x1), r1=87(y1), r2=111(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 87
LDI r2, 111
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
