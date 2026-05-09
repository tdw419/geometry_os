; DESCRIPTION: Places a black line segment connecting (69, 149) to (111, 19).
; PLAN: r0=69(x1), r1=149(y1), r2=111(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 149
LDI r2, 111
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
