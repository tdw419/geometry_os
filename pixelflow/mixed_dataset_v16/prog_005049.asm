; DESCRIPTION: Renders a white line between points (118, 2) and (59, 92).
; PLAN: r0=118(x1), r1=2(y1), r2=59(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 2
LDI r2, 59
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
