; DESCRIPTION: Composite: . Then Draws a purple circle centered at (199, 221) with radius 15. Then Places a magenta dot at position (80, 205).
; PLAN: r0=199(x), r1=221(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=80(x), r1=205(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (199, 221) with radius 15.
; PLAN: r0=199(x), r1=221(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 221
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (80, 205).
; PLAN: r0=80(x), r1=205(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 205
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
