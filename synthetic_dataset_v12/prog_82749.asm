; DESCRIPTION: Renders a magenta line between points (77, 220) and (360, 225).
; PLAN: r0=77(x1), r1=220(y1), r2=360(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 220
LDI r2, 360
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
