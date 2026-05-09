; DESCRIPTION: Renders a white line between points (194, 53) and (317, 154).
; PLAN: r0=194(x1), r1=53(y1), r2=317(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 53
LDI r2, 317
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
