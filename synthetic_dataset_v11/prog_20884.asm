; DESCRIPTION: Draws a white line from (167, 56) to (83, 51).
; PLAN: r0=167(x1), r1=56(y1), r2=83(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 56
LDI r2, 83
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
