; DESCRIPTION: Composite: . Then Places a orange dot at position (10, 29). Then Places a yellow line segment connecting (45, 239) to (144, 12).
; PLAN: r0=10(x), r1=29(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=45(x1), r1=239(y1), r2=144(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (10, 29).
; PLAN: r0=10(x), r1=29(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 29
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a yellow line segment connecting (45, 239) to (144, 12).
; PLAN: r0=45(x1), r1=239(y1), r2=144(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 239
LDI r2, 144
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
