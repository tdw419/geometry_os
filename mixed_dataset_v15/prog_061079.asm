; DESCRIPTION: Places a magenta line segment connecting (504, 1) to (360, 75).
; PLAN: r0=504(x1), r1=1(y1), r2=360(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 1
LDI r2, 360
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
