; DESCRIPTION: Places a black line segment connecting (38, 130) to (218, 72).
; PLAN: r0=38(x1), r1=130(y1), r2=218(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 130
LDI r2, 218
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
