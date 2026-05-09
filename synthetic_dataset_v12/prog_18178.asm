; DESCRIPTION: Places a orange line segment connecting (187, 121) to (32, 11).
; PLAN: r0=187(x1), r1=121(y1), r2=32(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 121
LDI r2, 32
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
