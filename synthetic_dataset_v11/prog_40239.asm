; DESCRIPTION: Composite: . Then Places a cyan dot at position (72, 162). Then Draws a black circle centered at (96, 124) with radius 56.
; PLAN: r0=72(x), r1=162(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=96(x), r1=124(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (72, 162).
; PLAN: r0=72(x), r1=162(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 162
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a black circle centered at (96, 124) with radius 56.
; PLAN: r0=96(x), r1=124(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 124
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
