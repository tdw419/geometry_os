; DESCRIPTION: Places a black line segment connecting (241, 124) to (276, 60).
; PLAN: r0=241(x1), r1=124(y1), r2=276(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 124
LDI r2, 276
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
