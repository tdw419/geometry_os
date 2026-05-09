; DESCRIPTION: Places a orange line segment connecting (35, 197) to (131, 126).
; PLAN: r0=35(x1), r1=197(y1), r2=131(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 197
LDI r2, 131
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
