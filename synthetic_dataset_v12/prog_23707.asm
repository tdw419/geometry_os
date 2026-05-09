; DESCRIPTION: Renders a magenta line between points (463, 68) and (241, 102).
; PLAN: r0=463(x1), r1=68(y1), r2=241(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 68
LDI r2, 241
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
