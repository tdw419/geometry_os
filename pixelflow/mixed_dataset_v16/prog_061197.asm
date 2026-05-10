; DESCRIPTION: Renders a orange line segment connecting (277, 127) to (335, 151).
; PLAN: r0=277(x1), r1=127(y1), r2=335(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 127
LDI r2, 335
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
