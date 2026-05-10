; DESCRIPTION: Renders a yellow line between points (2, 92) and (261, 50).
; PLAN: r0=2(x1), r1=92(y1), r2=261(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 92
LDI r2, 261
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
