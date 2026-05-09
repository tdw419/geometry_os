; DESCRIPTION: Renders a magenta line between points (343, 228) and (250, 76).
; PLAN: r0=343(x1), r1=228(y1), r2=250(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 228
LDI r2, 250
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
