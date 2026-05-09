; DESCRIPTION: Composite: . Then Draws a orange circle centered at (168, 51) with radius 40. Then Places a purple dot at position (127, 151).
; PLAN: r0=168(x), r1=51(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=127(x), r1=151(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange circle centered at (168, 51) with radius 40.
; PLAN: r0=168(x), r1=51(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 51
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (127, 151).
; PLAN: r0=127(x), r1=151(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 151
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
