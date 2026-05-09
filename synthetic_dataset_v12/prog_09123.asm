; DESCRIPTION: Renders a yellow line between points (504, 208) and (156, 71).
; PLAN: r0=504(x1), r1=208(y1), r2=156(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 208
LDI r2, 156
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
