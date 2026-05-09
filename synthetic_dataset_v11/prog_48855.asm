; DESCRIPTION: Renders a white line between points (244, 109) and (22, 13).
; PLAN: r0=244(x1), r1=109(y1), r2=22(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 109
LDI r2, 22
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
