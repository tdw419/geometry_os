; DESCRIPTION: Composite: . Then Places a orange line segment connecting (86, 233) to (1, 72). Then Places a white dot at position (222, 224).
; PLAN: r0=86(x1), r1=233(y1), r2=1(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=222(x), r1=224(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange line segment connecting (86, 233) to (1, 72).
; PLAN: r0=86(x1), r1=233(y1), r2=1(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 233
LDI r2, 1
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (222, 224).
; PLAN: r0=222(x), r1=224(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 222
LDI r1, 224
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
