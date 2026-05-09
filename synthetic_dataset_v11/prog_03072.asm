; DESCRIPTION: Places a red line segment connecting (47, 32) to (127, 12).
; PLAN: r0=47(x1), r1=32(y1), r2=127(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 32
LDI r2, 127
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
