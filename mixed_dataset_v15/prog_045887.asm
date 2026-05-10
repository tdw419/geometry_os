; DESCRIPTION: Renders a magenta line between points (240, 175) and (466, 237).
; PLAN: r0=240(x1), r1=175(y1), r2=466(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 175
LDI r2, 466
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
