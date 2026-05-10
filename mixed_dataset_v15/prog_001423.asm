; DESCRIPTION: Draws a white line from (5, 140) to (54, 250).
; PLAN: r0=5(x1), r1=140(y1), r2=54(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 140
LDI r2, 54
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
