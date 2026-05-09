; DESCRIPTION: Draws a white line from (430, 95) to (283, 1).
; PLAN: r0=430(x1), r1=95(y1), r2=283(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 95
LDI r2, 283
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
