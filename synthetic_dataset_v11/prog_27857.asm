; DESCRIPTION: Places a orange line segment connecting (239, 190) to (248, 84).
; PLAN: r0=239(x1), r1=190(y1), r2=248(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 190
LDI r2, 248
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
