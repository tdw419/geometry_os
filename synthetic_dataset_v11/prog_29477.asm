; DESCRIPTION: Composite: . Then Sets a single orange pixel at (171, 32). Then Draws a white circle centered at (142, 128) with radius 72.
; PLAN: r0=171(x), r1=32(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=142(x), r1=128(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (171, 32).
; PLAN: r0=171(x), r1=32(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 32
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a white circle centered at (142, 128) with radius 72.
; PLAN: r0=142(x), r1=128(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 128
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
