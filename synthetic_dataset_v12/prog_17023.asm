; DESCRIPTION: Draws a white line from (399, 110) to (166, 75).
; PLAN: r0=399(x1), r1=110(y1), r2=166(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 110
LDI r2, 166
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
