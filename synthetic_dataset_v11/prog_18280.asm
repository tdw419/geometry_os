; DESCRIPTION: Composite: . Then Draws a orange circle centered at (80, 91) with radius 80. Then Places a red dot at position (108, 100).
; PLAN: r0=80(x), r1=91(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=108(x), r1=100(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange circle centered at (80, 91) with radius 80.
; PLAN: r0=80(x), r1=91(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 91
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (108, 100).
; PLAN: r0=108(x), r1=100(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 100
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
