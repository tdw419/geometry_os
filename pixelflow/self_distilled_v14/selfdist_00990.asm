; DESCRIPTION: Renders a red line segment connecting (142, 91) to (322, 165).
; PLAN: r0=142(x1), r1=91(y1), r2=322(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 91
LDI r2, 322
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
