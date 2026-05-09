; DESCRIPTION: Places a orange line segment connecting (152, 182) to (374, 180).
; PLAN: r0=152(x1), r1=182(y1), r2=374(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 182
LDI r2, 374
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
