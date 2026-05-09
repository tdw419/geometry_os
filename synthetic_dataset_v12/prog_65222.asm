; DESCRIPTION: Renders a magenta line between points (343, 205) and (297, 174).
; PLAN: r0=343(x1), r1=205(y1), r2=297(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 205
LDI r2, 297
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
