; DESCRIPTION: Renders a green line between points (163, 239) and (118, 55).
; PLAN: r0=163(x1), r1=239(y1), r2=118(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 239
LDI r2, 118
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
