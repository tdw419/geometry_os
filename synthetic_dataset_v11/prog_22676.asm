; DESCRIPTION: Renders a magenta line between points (102, 226) and (240, 217).
; PLAN: r0=102(x1), r1=226(y1), r2=240(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 226
LDI r2, 240
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
