; DESCRIPTION: Renders a magenta line between points (184, 6) and (193, 2).
; PLAN: r0=184(x1), r1=6(y1), r2=193(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 6
LDI r2, 193
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
