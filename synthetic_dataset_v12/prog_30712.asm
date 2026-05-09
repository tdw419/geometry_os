; DESCRIPTION: Places a orange line segment connecting (87, 107) to (320, 247).
; PLAN: r0=87(x1), r1=107(y1), r2=320(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 107
LDI r2, 320
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
