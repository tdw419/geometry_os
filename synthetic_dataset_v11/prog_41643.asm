; DESCRIPTION: Composite: . Then Draws a orange circle centered at (54, 203) with radius 27. Then Sets a single cyan pixel at (101, 79).
; PLAN: r0=54(x), r1=203(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=101(x), r1=79(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange circle centered at (54, 203) with radius 27.
; PLAN: r0=54(x), r1=203(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 203
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (101, 79).
; PLAN: r0=101(x), r1=79(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 79
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
