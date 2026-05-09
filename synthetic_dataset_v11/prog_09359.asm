; DESCRIPTION: Renders a white line between points (112, 112) and (163, 154).
; PLAN: r0=112(x1), r1=112(y1), r2=163(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 112
LDI r2, 163
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
