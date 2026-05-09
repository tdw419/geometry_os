; DESCRIPTION: Renders a red line between points (156, 232) and (279, 163).
; PLAN: r0=156(x1), r1=232(y1), r2=279(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 232
LDI r2, 279
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
