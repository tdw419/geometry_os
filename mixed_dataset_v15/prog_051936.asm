; DESCRIPTION: Renders a white line between points (12, 141) and (92, 120).
; PLAN: r0=12(x1), r1=141(y1), r2=92(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 141
LDI r2, 92
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
