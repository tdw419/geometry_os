; DESCRIPTION: Places a red line segment connecting (254, 147) to (156, 239).
; PLAN: r0=254(x1), r1=147(y1), r2=156(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 147
LDI r2, 156
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
