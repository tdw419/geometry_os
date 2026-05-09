; DESCRIPTION: Places a orange line segment connecting (160, 228) to (1, 133).
; PLAN: r0=160(x1), r1=228(y1), r2=1(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 228
LDI r2, 1
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
