; DESCRIPTION: Places a white line segment connecting (97, 182) to (138, 220).
; PLAN: r0=97(x1), r1=182(y1), r2=138(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 182
LDI r2, 138
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
