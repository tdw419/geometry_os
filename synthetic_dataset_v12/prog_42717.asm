; DESCRIPTION: Places a orange line segment connecting (128, 239) to (449, 92).
; PLAN: r0=128(x1), r1=239(y1), r2=449(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 239
LDI r2, 449
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
