; DESCRIPTION: Renders a green line between points (65, 166) and (47, 212).
; PLAN: r0=65(x1), r1=166(y1), r2=47(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 166
LDI r2, 47
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
