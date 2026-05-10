; DESCRIPTION: Places a magenta line segment connecting (292, 46) to (185, 122).
; PLAN: r0=292(x1), r1=46(y1), r2=185(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 46
LDI r2, 185
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
