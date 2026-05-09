; DESCRIPTION: Renders a magenta line between points (27, 75) and (241, 17).
; PLAN: r0=27(x1), r1=75(y1), r2=241(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 75
LDI r2, 241
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
