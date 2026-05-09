; DESCRIPTION: Places a red line segment connecting (190, 93) to (54, 37).
; PLAN: r0=190(x1), r1=93(y1), r2=54(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 93
LDI r2, 54
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
