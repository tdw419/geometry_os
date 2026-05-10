; DESCRIPTION: Renders a magenta line between points (33, 99) and (138, 193).
; PLAN: r0=33(x1), r1=99(y1), r2=138(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 99
LDI r2, 138
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
