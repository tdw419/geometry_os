; DESCRIPTION: Renders a magenta line between points (187, 165) and (92, 245).
; PLAN: r0=187(x1), r1=165(y1), r2=92(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 165
LDI r2, 92
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
