; DESCRIPTION: Composite: . Then Places a green dot at position (67, 19). Then Draws a orange circle centered at (35, 100) with radius 31.
; PLAN: r0=67(x), r1=19(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=35(x), r1=100(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (67, 19).
; PLAN: r0=67(x), r1=19(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 19
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a orange circle centered at (35, 100) with radius 31.
; PLAN: r0=35(x), r1=100(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 100
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
