; DESCRIPTION: Places a orange line segment connecting (474, 93) to (126, 65).
; PLAN: r0=474(x1), r1=93(y1), r2=126(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 93
LDI r2, 126
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
