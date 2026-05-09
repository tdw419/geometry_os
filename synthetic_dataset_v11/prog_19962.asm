; DESCRIPTION: Renders a white line between points (92, 166) and (166, 18).
; PLAN: r0=92(x1), r1=166(y1), r2=166(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 166
LDI r2, 166
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
