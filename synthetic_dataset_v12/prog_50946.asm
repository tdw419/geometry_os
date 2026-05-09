; DESCRIPTION: Places a red line segment connecting (397, 93) to (25, 131).
; PLAN: r0=397(x1), r1=93(y1), r2=25(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 93
LDI r2, 25
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
