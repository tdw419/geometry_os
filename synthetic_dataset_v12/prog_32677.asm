; DESCRIPTION: Places a white line segment connecting (3, 66) to (159, 27).
; PLAN: r0=3(x1), r1=66(y1), r2=159(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 66
LDI r2, 159
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
