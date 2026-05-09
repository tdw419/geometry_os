; DESCRIPTION: Places a white line segment connecting (237, 34) to (51, 240).
; PLAN: r0=237(x1), r1=34(y1), r2=51(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 34
LDI r2, 51
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
