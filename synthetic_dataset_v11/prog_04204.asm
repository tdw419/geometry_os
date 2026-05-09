; DESCRIPTION: Places a white line segment connecting (182, 19) to (202, 145).
; PLAN: r0=182(x1), r1=19(y1), r2=202(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 19
LDI r2, 202
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
