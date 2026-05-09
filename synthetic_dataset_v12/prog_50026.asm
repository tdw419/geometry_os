; DESCRIPTION: Renders a yellow line between points (368, 220) and (110, 73).
; PLAN: r0=368(x1), r1=220(y1), r2=110(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 220
LDI r2, 110
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
