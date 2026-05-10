; DESCRIPTION: Renders a white line segment connecting (339, 151) to (133, 134).
; PLAN: r0=339(x1), r1=151(y1), r2=133(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 151
LDI r2, 133
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
