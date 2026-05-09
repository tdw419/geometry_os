; DESCRIPTION: Places a orange line segment connecting (450, 161) to (299, 197).
; PLAN: r0=450(x1), r1=161(y1), r2=299(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 161
LDI r2, 299
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
