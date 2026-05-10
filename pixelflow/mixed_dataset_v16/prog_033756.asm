; DESCRIPTION: Places a white line segment connecting (266, 244) to (511, 121).
; PLAN: r0=266(x1), r1=244(y1), r2=511(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 244
LDI r2, 511
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
