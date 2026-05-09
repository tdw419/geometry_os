; DESCRIPTION: Renders a magenta line between points (222, 233) and (230, 162).
; PLAN: r0=222(x1), r1=233(y1), r2=230(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 233
LDI r2, 230
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
