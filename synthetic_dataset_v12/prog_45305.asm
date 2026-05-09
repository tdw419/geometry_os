; DESCRIPTION: Places a white line segment connecting (270, 31) to (494, 51).
; PLAN: r0=270(x1), r1=31(y1), r2=494(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 31
LDI r2, 494
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
