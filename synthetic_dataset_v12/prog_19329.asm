; DESCRIPTION: Places a orange line segment connecting (239, 32) to (333, 86).
; PLAN: r0=239(x1), r1=32(y1), r2=333(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 32
LDI r2, 333
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
