; DESCRIPTION: Places a white line segment connecting (198, 26) to (241, 63).
; PLAN: r0=198(x1), r1=26(y1), r2=241(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 26
LDI r2, 241
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
