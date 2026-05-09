; DESCRIPTION: Composite: . Then Sets a single red pixel at (252, 235). Then Renders a blue disk with center (57, 59) and radius 53.
; PLAN: r0=252(x), r1=235(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=57(x), r1=59(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single red pixel at (252, 235).
; PLAN: r0=252(x), r1=235(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 252
LDI r1, 235
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a blue disk with center (57, 59) and radius 53.
; PLAN: r0=57(x), r1=59(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 59
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
