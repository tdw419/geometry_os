; DESCRIPTION: Renders a white line segment connecting (322, 88) to (267, 161).
; PLAN: r0=322(x1), r1=88(y1), r2=267(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 88
LDI r2, 267
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
