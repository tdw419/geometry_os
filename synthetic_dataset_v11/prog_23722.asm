; DESCRIPTION: Renders a white line between points (92, 134) and (176, 237).
; PLAN: r0=92(x1), r1=134(y1), r2=176(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 134
LDI r2, 176
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
