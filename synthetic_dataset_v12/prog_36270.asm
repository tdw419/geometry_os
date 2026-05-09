; DESCRIPTION: Renders a magenta line between points (454, 69) and (385, 72).
; PLAN: r0=454(x1), r1=69(y1), r2=385(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 69
LDI r2, 385
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
