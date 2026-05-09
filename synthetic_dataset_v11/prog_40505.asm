; DESCRIPTION: Composite: . Then Draws a purple circle centered at (216, 74) with radius 25. Then Places a black dot at position (224, 22).
; PLAN: r0=216(x), r1=74(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=224(x), r1=22(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (216, 74) with radius 25.
; PLAN: r0=216(x), r1=74(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 74
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (224, 22).
; PLAN: r0=224(x), r1=22(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 224
LDI r1, 22
LDI r2, 0x000000
PSET r0, r1, r2
HALT
