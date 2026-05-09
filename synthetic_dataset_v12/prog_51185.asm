; DESCRIPTION: Places a orange line segment connecting (121, 117) to (371, 193).
; PLAN: r0=121(x1), r1=117(y1), r2=371(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 117
LDI r2, 371
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
