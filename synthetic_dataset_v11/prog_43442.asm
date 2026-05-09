; DESCRIPTION: Renders a magenta line between points (178, 189) and (50, 92).
; PLAN: r0=178(x1), r1=189(y1), r2=50(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 189
LDI r2, 50
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
