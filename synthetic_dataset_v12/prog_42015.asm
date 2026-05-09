; DESCRIPTION: Renders a green line between points (84, 81) and (225, 71).
; PLAN: r0=84(x1), r1=81(y1), r2=225(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 81
LDI r2, 225
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
