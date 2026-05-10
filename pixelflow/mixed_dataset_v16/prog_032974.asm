; DESCRIPTION: Renders a magenta line between points (454, 44) and (225, 172).
; PLAN: r0=454(x1), r1=44(y1), r2=225(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 44
LDI r2, 225
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
