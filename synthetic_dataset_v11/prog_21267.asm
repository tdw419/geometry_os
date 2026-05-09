; DESCRIPTION: Renders a green line between points (124, 127) and (118, 95).
; PLAN: r0=124(x1), r1=127(y1), r2=118(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 127
LDI r2, 118
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
