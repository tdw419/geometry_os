; DESCRIPTION: Places a magenta line segment connecting (185, 243) to (414, 55).
; PLAN: r0=185(x1), r1=243(y1), r2=414(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 243
LDI r2, 414
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
