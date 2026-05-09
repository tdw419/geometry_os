; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (223, 151) with radius 14. Then Sets a single red pixel at (23, 107).
; PLAN: r0=223(x), r1=151(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=23(x), r1=107(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow circle centered at (223, 151) with radius 14.
; PLAN: r0=223(x), r1=151(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 151
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (23, 107).
; PLAN: r0=23(x), r1=107(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 107
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
