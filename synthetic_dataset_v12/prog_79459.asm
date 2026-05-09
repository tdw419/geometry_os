; DESCRIPTION: Renders a white line between points (470, 102) and (477, 13).
; PLAN: r0=470(x1), r1=102(y1), r2=477(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 102
LDI r2, 477
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
