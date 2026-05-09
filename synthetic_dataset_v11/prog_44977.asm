; DESCRIPTION: Composite: . Then Sets a single orange pixel at (46, 113). Then Draws a red circle centered at (138, 110) with radius 72.
; PLAN: r0=46(x), r1=113(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=138(x), r1=110(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (46, 113).
; PLAN: r0=46(x), r1=113(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 46
LDI r1, 113
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a red circle centered at (138, 110) with radius 72.
; PLAN: r0=138(x), r1=110(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 110
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
