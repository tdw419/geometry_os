; DESCRIPTION: Composite: . Then Sets a single orange pixel at (35, 61). Then Draws a white circle centered at (103, 181) with radius 13.
; PLAN: r0=35(x), r1=61(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=103(x), r1=181(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (35, 61).
; PLAN: r0=35(x), r1=61(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 35
LDI r1, 61
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a white circle centered at (103, 181) with radius 13.
; PLAN: r0=103(x), r1=181(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 181
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
