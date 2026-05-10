; DESCRIPTION: Renders a red line segment connecting (355, 138) to (33, 196).
; PLAN: r0=355(x1), r1=138(y1), r2=33(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 138
LDI r2, 33
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
