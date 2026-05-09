; DESCRIPTION: Places a orange line segment connecting (149, 107) to (256, 103).
; PLAN: r0=149(x1), r1=107(y1), r2=256(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 107
LDI r2, 256
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
