; DESCRIPTION: Renders a white line between points (92, 114) and (182, 10).
; PLAN: r0=92(x1), r1=114(y1), r2=182(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 114
LDI r2, 182
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
