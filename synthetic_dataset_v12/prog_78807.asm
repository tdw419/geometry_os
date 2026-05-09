; DESCRIPTION: Renders a yellow line between points (323, 59) and (228, 101).
; PLAN: r0=323(x1), r1=59(y1), r2=228(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 59
LDI r2, 228
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
