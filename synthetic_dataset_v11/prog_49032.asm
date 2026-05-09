; DESCRIPTION: Places a white line segment connecting (66, 124) to (182, 105).
; PLAN: r0=66(x1), r1=124(y1), r2=182(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 124
LDI r2, 182
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
