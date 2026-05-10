; DESCRIPTION: Renders a magenta line between points (69, 37) and (356, 70).
; PLAN: r0=69(x1), r1=37(y1), r2=356(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 37
LDI r2, 356
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
