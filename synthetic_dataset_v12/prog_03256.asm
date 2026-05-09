; DESCRIPTION: Draws a white line from (399, 69) to (44, 158).
; PLAN: r0=399(x1), r1=69(y1), r2=44(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 69
LDI r2, 44
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
