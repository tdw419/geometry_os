; DESCRIPTION: Places a black line segment connecting (261, 82) to (160, 47).
; PLAN: r0=261(x1), r1=82(y1), r2=160(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 82
LDI r2, 160
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
