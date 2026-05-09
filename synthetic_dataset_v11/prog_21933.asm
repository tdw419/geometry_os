; DESCRIPTION: Composite: . Then Places a white dot at position (247, 6). Then Creates a yellow circular shape at (171, 95) with radius 70.
; PLAN: r0=247(x), r1=6(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=171(x), r1=95(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (247, 6).
; PLAN: r0=247(x), r1=6(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 6
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow circular shape at (171, 95) with radius 70.
; PLAN: r0=171(x), r1=95(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 95
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
