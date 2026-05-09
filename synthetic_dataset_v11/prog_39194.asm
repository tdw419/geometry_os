; DESCRIPTION: Draws a white line from (101, 77) to (23, 233).
; PLAN: r0=101(x1), r1=77(y1), r2=23(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 77
LDI r2, 23
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
