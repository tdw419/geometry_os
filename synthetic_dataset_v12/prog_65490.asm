; DESCRIPTION: Renders a magenta line between points (494, 122) and (407, 39).
; PLAN: r0=494(x1), r1=122(y1), r2=407(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 122
LDI r2, 407
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
