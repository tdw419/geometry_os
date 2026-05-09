; DESCRIPTION: Places a orange line segment connecting (418, 127) to (280, 180).
; PLAN: r0=418(x1), r1=127(y1), r2=280(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 127
LDI r2, 280
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
