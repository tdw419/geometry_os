; DESCRIPTION: Renders a magenta line between points (143, 179) and (301, 252).
; PLAN: r0=143(x1), r1=179(y1), r2=301(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 179
LDI r2, 301
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
