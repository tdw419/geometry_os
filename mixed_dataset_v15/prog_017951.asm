; DESCRIPTION: Places a black line segment connecting (480, 36) to (108, 124).
; PLAN: r0=480(x1), r1=36(y1), r2=108(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 36
LDI r2, 108
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
