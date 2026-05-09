; DESCRIPTION: Composite: . Then Places a red dot at position (176, 181). Then Creates a green circular shape at (145, 146) with radius 45.
; PLAN: r0=176(x), r1=181(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=145(x), r1=146(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (176, 181).
; PLAN: r0=176(x), r1=181(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 181
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a green circular shape at (145, 146) with radius 45.
; PLAN: r0=145(x), r1=146(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 146
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
