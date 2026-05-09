; DESCRIPTION: Places a magenta line segment connecting (446, 120) to (93, 34).
; PLAN: r0=446(x1), r1=120(y1), r2=93(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 120
LDI r2, 93
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
