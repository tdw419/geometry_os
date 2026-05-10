; DESCRIPTION: Renders a red line segment connecting (196, 197) to (62, 20).
; PLAN: r0=196(x1), r1=197(y1), r2=62(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 197
LDI r2, 62
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
