; DESCRIPTION: Renders a purple line between points (23, 45) and (108, 73).
; PLAN: r0=23(x1), r1=45(y1), r2=108(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 45
LDI r2, 108
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
