; DESCRIPTION: Renders a green line between points (208, 4) and (233, 20).
; PLAN: r0=208(x1), r1=4(y1), r2=233(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 4
LDI r2, 233
LDI r3, 20
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
