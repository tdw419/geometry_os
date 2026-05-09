; DESCRIPTION: Composite: . Then Draws a green circle centered at (131, 120) with radius 70. Then Sets a single black pixel at (9, 200).
; PLAN: r0=131(x), r1=120(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=9(x), r1=200(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green circle centered at (131, 120) with radius 70.
; PLAN: r0=131(x), r1=120(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 120
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (9, 200).
; PLAN: r0=9(x), r1=200(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 200
LDI r2, 0x000000
PSET r0, r1, r2
HALT
