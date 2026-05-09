; DESCRIPTION: Places a black line segment connecting (280, 149) to (11, 71).
; PLAN: r0=280(x1), r1=149(y1), r2=11(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 149
LDI r2, 11
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
