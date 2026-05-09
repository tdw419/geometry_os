; DESCRIPTION: Places a white line segment connecting (149, 176) to (51, 172).
; PLAN: r0=149(x1), r1=176(y1), r2=51(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 176
LDI r2, 51
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
