; DESCRIPTION: Composite: . Then Sets a single black pixel at (108, 118). Then Draws a yellow circle centered at (127, 113) with radius 66.
; PLAN: r0=108(x), r1=118(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=127(x), r1=113(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (108, 118).
; PLAN: r0=108(x), r1=118(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 118
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow circle centered at (127, 113) with radius 66.
; PLAN: r0=127(x), r1=113(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 113
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
