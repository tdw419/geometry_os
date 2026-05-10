; DESCRIPTION: Renders a white line segment connecting (321, 171) to (22, 21).
; PLAN: r0=321(x1), r1=171(y1), r2=22(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 171
LDI r2, 22
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
