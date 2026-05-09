; DESCRIPTION: Renders a magenta line between points (18, 140) and (210, 142).
; PLAN: r0=18(x1), r1=140(y1), r2=210(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 140
LDI r2, 210
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
