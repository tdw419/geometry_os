; DESCRIPTION: Renders a magenta line between points (33, 91) and (84, 171).
; PLAN: r0=33(x1), r1=91(y1), r2=84(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 91
LDI r2, 84
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
