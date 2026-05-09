; DESCRIPTION: Renders a magenta line between points (167, 62) and (301, 159).
; PLAN: r0=167(x1), r1=62(y1), r2=301(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 62
LDI r2, 301
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
