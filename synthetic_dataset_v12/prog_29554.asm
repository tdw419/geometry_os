; DESCRIPTION: Renders a yellow line between points (9, 75) and (256, 9).
; PLAN: r0=9(x1), r1=75(y1), r2=256(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 75
LDI r2, 256
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
