; DESCRIPTION: Renders a white line between points (261, 132) and (477, 49).
; PLAN: r0=261(x1), r1=132(y1), r2=477(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 132
LDI r2, 477
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
