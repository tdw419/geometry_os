; DESCRIPTION: Renders a white line between points (92, 245) and (161, 149).
; PLAN: r0=92(x1), r1=245(y1), r2=161(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 245
LDI r2, 161
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
