; DESCRIPTION: Places a orange line segment connecting (94, 43) to (125, 215).
; PLAN: r0=94(x1), r1=43(y1), r2=125(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 43
LDI r2, 125
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
