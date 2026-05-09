; DESCRIPTION: Places a red line segment connecting (496, 150) to (180, 239).
; PLAN: r0=496(x1), r1=150(y1), r2=180(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 150
LDI r2, 180
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
