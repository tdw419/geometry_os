; DESCRIPTION: Renders a magenta line between points (419, 80) and (466, 187).
; PLAN: r0=419(x1), r1=80(y1), r2=466(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 80
LDI r2, 466
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
