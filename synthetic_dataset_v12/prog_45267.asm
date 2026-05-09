; DESCRIPTION: Places a black line segment connecting (332, 79) to (466, 225).
; PLAN: r0=332(x1), r1=79(y1), r2=466(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 79
LDI r2, 466
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
