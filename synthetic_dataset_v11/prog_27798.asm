; DESCRIPTION: Places a orange line segment connecting (13, 248) to (238, 146).
; PLAN: r0=13(x1), r1=248(y1), r2=238(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 248
LDI r2, 238
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
