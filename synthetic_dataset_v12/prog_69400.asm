; DESCRIPTION: Places a white line segment connecting (432, 127) to (18, 52).
; PLAN: r0=432(x1), r1=127(y1), r2=18(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 127
LDI r2, 18
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
