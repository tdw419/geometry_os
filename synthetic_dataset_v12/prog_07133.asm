; DESCRIPTION: Places a orange line segment connecting (45, 94) to (260, 171).
; PLAN: r0=45(x1), r1=94(y1), r2=260(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 94
LDI r2, 260
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
