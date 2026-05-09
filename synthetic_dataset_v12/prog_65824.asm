; DESCRIPTION: Renders a yellow line between points (210, 10) and (166, 3).
; PLAN: r0=210(x1), r1=10(y1), r2=166(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 10
LDI r2, 166
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
