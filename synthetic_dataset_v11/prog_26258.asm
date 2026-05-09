; DESCRIPTION: Renders a white line between points (92, 85) and (190, 88).
; PLAN: r0=92(x1), r1=85(y1), r2=190(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 85
LDI r2, 190
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
