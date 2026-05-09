; DESCRIPTION: Renders a black line between points (280, 140) and (104, 85).
; PLAN: r0=280(x1), r1=140(y1), r2=104(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 140
LDI r2, 104
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
