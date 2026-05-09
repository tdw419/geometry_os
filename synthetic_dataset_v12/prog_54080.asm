; DESCRIPTION: Places a magenta line segment connecting (114, 243) to (69, 58).
; PLAN: r0=114(x1), r1=243(y1), r2=69(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 243
LDI r2, 69
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
