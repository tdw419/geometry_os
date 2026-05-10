; DESCRIPTION: Renders a white line segment connecting (264, 171) to (181, 94).
; PLAN: r0=264(x1), r1=171(y1), r2=181(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 171
LDI r2, 181
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
