; DESCRIPTION: Places a green line segment connecting (83, 93) to (25, 165).
; PLAN: r0=83(x1), r1=93(y1), r2=25(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 93
LDI r2, 25
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
