; DESCRIPTION: Renders a magenta line between points (210, 225) and (253, 34).
; PLAN: r0=210(x1), r1=225(y1), r2=253(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 225
LDI r2, 253
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
