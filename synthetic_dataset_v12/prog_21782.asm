; DESCRIPTION: Places a red line segment connecting (165, 5) to (151, 44).
; PLAN: r0=165(x1), r1=5(y1), r2=151(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 5
LDI r2, 151
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
