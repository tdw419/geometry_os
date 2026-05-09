; DESCRIPTION: Places a white line segment connecting (399, 210) to (483, 240).
; PLAN: r0=399(x1), r1=210(y1), r2=483(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 210
LDI r2, 483
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
