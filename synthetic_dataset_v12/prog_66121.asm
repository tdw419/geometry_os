; DESCRIPTION: Renders a magenta line between points (292, 19) and (245, 89).
; PLAN: r0=292(x1), r1=19(y1), r2=245(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 19
LDI r2, 245
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
