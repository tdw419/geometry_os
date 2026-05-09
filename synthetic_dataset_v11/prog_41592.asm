; DESCRIPTION: Composite: . Then Draws a blue circle centered at (131, 29) with radius 28. Then Places a red dot at position (150, 40).
; PLAN: r0=131(x), r1=29(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=150(x), r1=40(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue circle centered at (131, 29) with radius 28.
; PLAN: r0=131(x), r1=29(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 29
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (150, 40).
; PLAN: r0=150(x), r1=40(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 40
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
