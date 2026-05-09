; DESCRIPTION: Places a magenta line segment connecting (12, 93) to (54, 38).
; PLAN: r0=12(x1), r1=93(y1), r2=54(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 93
LDI r2, 54
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
