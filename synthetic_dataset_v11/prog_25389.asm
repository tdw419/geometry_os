; DESCRIPTION: Renders a yellow line between points (85, 228) and (158, 51).
; PLAN: r0=85(x1), r1=228(y1), r2=158(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 228
LDI r2, 158
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
