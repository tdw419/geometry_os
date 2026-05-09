; DESCRIPTION: Places a orange line segment connecting (38, 240) to (248, 242).
; PLAN: r0=38(x1), r1=240(y1), r2=248(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 240
LDI r2, 248
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
