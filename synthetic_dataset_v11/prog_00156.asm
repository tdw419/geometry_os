; DESCRIPTION: Renders a white line between points (92, 111) and (148, 205).
; PLAN: r0=92(x1), r1=111(y1), r2=148(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 111
LDI r2, 148
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
