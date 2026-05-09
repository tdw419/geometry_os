; DESCRIPTION: Renders a yellow line between points (79, 66) and (160, 74).
; PLAN: r0=79(x1), r1=66(y1), r2=160(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 66
LDI r2, 160
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
