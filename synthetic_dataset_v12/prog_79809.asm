; DESCRIPTION: Places a yellow line segment connecting (79, 93) to (395, 54).
; PLAN: r0=79(x1), r1=93(y1), r2=395(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 93
LDI r2, 395
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
