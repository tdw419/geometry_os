; DESCRIPTION: Renders a magenta line between points (29, 16) and (225, 54).
; PLAN: r0=29(x1), r1=16(y1), r2=225(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 16
LDI r2, 225
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
