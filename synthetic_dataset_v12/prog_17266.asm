; DESCRIPTION: Renders a white line between points (508, 103) and (491, 31).
; PLAN: r0=508(x1), r1=103(y1), r2=491(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 103
LDI r2, 491
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
