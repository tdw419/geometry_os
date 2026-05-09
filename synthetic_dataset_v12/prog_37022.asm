; DESCRIPTION: Places a red line segment connecting (270, 44) to (12, 6).
; PLAN: r0=270(x1), r1=44(y1), r2=12(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 44
LDI r2, 12
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
