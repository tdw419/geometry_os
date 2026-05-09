; DESCRIPTION: Places a orange line segment connecting (18, 59) to (510, 222).
; PLAN: r0=18(x1), r1=59(y1), r2=510(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 59
LDI r2, 510
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
