; DESCRIPTION: Renders a green line between points (120, 240) and (252, 163).
; PLAN: r0=120(x1), r1=240(y1), r2=252(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 240
LDI r2, 252
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
