; DESCRIPTION: Places a white line segment connecting (508, 82) to (1, 107).
; PLAN: r0=508(x1), r1=82(y1), r2=1(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 82
LDI r2, 1
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
