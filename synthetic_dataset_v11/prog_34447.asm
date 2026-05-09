; DESCRIPTION: Renders a yellow line between points (26, 197) and (95, 250).
; PLAN: r0=26(x1), r1=197(y1), r2=95(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 197
LDI r2, 95
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
