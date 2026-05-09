; DESCRIPTION: Places a white line segment connecting (241, 150) to (66, 121).
; PLAN: r0=241(x1), r1=150(y1), r2=66(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 150
LDI r2, 66
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
