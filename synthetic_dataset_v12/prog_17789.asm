; DESCRIPTION: Places a orange line segment connecting (375, 211) to (180, 107).
; PLAN: r0=375(x1), r1=211(y1), r2=180(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 211
LDI r2, 180
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
