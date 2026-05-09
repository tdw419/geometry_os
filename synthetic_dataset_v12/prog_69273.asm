; DESCRIPTION: Places a orange line segment connecting (449, 38) to (442, 242).
; PLAN: r0=449(x1), r1=38(y1), r2=442(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 38
LDI r2, 442
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
