; DESCRIPTION: Places a black line segment connecting (263, 55) to (139, 19).
; PLAN: r0=263(x1), r1=55(y1), r2=139(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 55
LDI r2, 139
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
