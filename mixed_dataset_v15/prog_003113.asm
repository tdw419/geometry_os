; DESCRIPTION: Renders a white line between points (164, 92) and (253, 25).
; PLAN: r0=164(x1), r1=92(y1), r2=253(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 92
LDI r2, 253
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
