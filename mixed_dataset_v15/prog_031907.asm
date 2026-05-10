; DESCRIPTION: Draws a white line from (227, 22) to (420, 47).
; PLAN: r0=227(x1), r1=22(y1), r2=420(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 22
LDI r2, 420
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
