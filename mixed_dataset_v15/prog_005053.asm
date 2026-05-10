; DESCRIPTION: Renders a magenta line between points (434, 68) and (170, 225).
; PLAN: r0=434(x1), r1=68(y1), r2=170(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 68
LDI r2, 170
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
