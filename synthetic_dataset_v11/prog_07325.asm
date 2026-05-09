; DESCRIPTION: Composite: . Then Draws a purple circle centered at (197, 151) with radius 45. Then Places a purple dot at position (175, 70).
; PLAN: r0=197(x), r1=151(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=175(x), r1=70(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (197, 151) with radius 45.
; PLAN: r0=197(x), r1=151(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 151
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (175, 70).
; PLAN: r0=175(x), r1=70(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 70
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
