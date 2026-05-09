; DESCRIPTION: Places a white line segment connecting (287, 195) to (241, 250).
; PLAN: r0=287(x1), r1=195(y1), r2=241(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 195
LDI r2, 241
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
