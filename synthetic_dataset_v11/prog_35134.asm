; DESCRIPTION: Composite: . Then Places a magenta circle of radius 19 at center (171, 147). Then Places a yellow dot at position (31, 215).
; PLAN: r0=171(x), r1=147(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=31(x), r1=215(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta circle of radius 19 at center (171, 147).
; PLAN: r0=171(x), r1=147(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 147
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow dot at position (31, 215).
; PLAN: r0=31(x), r1=215(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 215
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
