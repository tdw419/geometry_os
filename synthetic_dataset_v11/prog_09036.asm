; DESCRIPTION: Renders a yellow line between points (220, 189) and (178, 162).
; PLAN: r0=220(x1), r1=189(y1), r2=178(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 189
LDI r2, 178
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
