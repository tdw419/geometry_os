; DESCRIPTION: Draws a white line from (506, 92) to (508, 193).
; PLAN: r0=506(x1), r1=92(y1), r2=508(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 92
LDI r2, 508
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
