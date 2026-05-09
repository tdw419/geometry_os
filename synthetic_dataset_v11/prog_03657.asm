; DESCRIPTION: Renders a white line between points (240, 15) and (200, 87).
; PLAN: r0=240(x1), r1=15(y1), r2=200(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 15
LDI r2, 200
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
