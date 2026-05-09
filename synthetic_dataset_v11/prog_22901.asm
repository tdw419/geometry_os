; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (58, 186) with radius 31. Then Places a red dot at position (14, 200).
; PLAN: r0=58(x), r1=186(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=14(x), r1=200(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta circle centered at (58, 186) with radius 31.
; PLAN: r0=58(x), r1=186(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 186
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (14, 200).
; PLAN: r0=14(x), r1=200(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 14
LDI r1, 200
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
