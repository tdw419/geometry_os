; DESCRIPTION: Composite: . Then Places a black line segment connecting (114, 18) to (195, 202). Then Sets a single white pixel at (224, 64).
; PLAN: r0=114(x1), r1=18(y1), r2=195(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=224(x), r1=64(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (114, 18) to (195, 202).
; PLAN: r0=114(x1), r1=18(y1), r2=195(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 18
LDI r2, 195
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (224, 64).
; PLAN: r0=224(x), r1=64(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 224
LDI r1, 64
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
