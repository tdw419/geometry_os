; DESCRIPTION: Renders a yellow line between points (26, 90) and (1, 195).
; PLAN: r0=26(x1), r1=90(y1), r2=1(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 90
LDI r2, 1
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
