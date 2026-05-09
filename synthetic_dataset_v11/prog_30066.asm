; DESCRIPTION: Renders a green line between points (247, 75) and (63, 163).
; PLAN: r0=247(x1), r1=75(y1), r2=63(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 75
LDI r2, 63
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
