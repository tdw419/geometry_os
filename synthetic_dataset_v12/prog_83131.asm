; DESCRIPTION: Renders a magenta line between points (356, 140) and (466, 243).
; PLAN: r0=356(x1), r1=140(y1), r2=466(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 140
LDI r2, 466
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
