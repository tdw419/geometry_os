; DESCRIPTION: Renders a magenta line between points (105, 165) and (209, 94).
; PLAN: r0=105(x1), r1=165(y1), r2=209(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 165
LDI r2, 209
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
