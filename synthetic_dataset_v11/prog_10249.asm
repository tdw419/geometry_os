; DESCRIPTION: Places a black line segment connecting (221, 92) to (243, 45).
; PLAN: r0=221(x1), r1=92(y1), r2=243(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 92
LDI r2, 243
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
