; DESCRIPTION: Composite: . Then Draws a orange circle centered at (196, 161) with radius 27. Then Sets a single yellow pixel at (67, 52).
; PLAN: r0=196(x), r1=161(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=67(x), r1=52(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange circle centered at (196, 161) with radius 27.
; PLAN: r0=196(x), r1=161(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 161
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single yellow pixel at (67, 52).
; PLAN: r0=67(x), r1=52(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 52
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
