; DESCRIPTION: Renders a yellow line between points (212, 74) and (3, 209).
; PLAN: r0=212(x1), r1=74(y1), r2=3(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 74
LDI r2, 3
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
