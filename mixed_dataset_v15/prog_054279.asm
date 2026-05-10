; DESCRIPTION: Places a orange line segment connecting (458, 244) to (327, 143).
; PLAN: r0=458(x1), r1=244(y1), r2=327(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 244
LDI r2, 327
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
