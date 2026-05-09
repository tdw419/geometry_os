; DESCRIPTION: Composite: . Then Draws a purple circle centered at (217, 97) with radius 22. Then Places a white dot at position (87, 60).
; PLAN: r0=217(x), r1=97(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=87(x), r1=60(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (217, 97) with radius 22.
; PLAN: r0=217(x), r1=97(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 97
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (87, 60).
; PLAN: r0=87(x), r1=60(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 60
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
