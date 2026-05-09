; DESCRIPTION: Places a green line segment connecting (10, 220) to (116, 93).
; PLAN: r0=10(x1), r1=220(y1), r2=116(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 220
LDI r2, 116
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
