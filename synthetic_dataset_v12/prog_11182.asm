; DESCRIPTION: Places a orange line segment connecting (152, 75) to (198, 190).
; PLAN: r0=152(x1), r1=75(y1), r2=198(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 75
LDI r2, 198
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
