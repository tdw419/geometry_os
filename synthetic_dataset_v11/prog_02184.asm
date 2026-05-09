; DESCRIPTION: Renders a magenta line between points (225, 70) and (196, 20).
; PLAN: r0=225(x1), r1=70(y1), r2=196(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 70
LDI r2, 196
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
