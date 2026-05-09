; DESCRIPTION: Renders a yellow line between points (26, 168) and (131, 158).
; PLAN: r0=26(x1), r1=168(y1), r2=131(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 168
LDI r2, 131
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
