; DESCRIPTION: Renders a yellow line between points (480, 212) and (69, 67).
; PLAN: r0=480(x1), r1=212(y1), r2=69(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 212
LDI r2, 69
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
