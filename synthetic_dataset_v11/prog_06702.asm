; DESCRIPTION: Places a orange line segment connecting (16, 92) to (17, 143).
; PLAN: r0=16(x1), r1=92(y1), r2=17(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 92
LDI r2, 17
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
