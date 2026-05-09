; DESCRIPTION: Renders a green line between points (232, 100) and (178, 132).
; PLAN: r0=232(x1), r1=100(y1), r2=178(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 100
LDI r2, 178
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
