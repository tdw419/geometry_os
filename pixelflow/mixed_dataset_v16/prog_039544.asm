; DESCRIPTION: Renders a white line segment connecting (4, 102) to (123, 134).
; PLAN: r0=4(x1), r1=102(y1), r2=123(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 102
LDI r2, 123
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
