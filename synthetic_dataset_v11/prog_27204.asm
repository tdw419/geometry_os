; DESCRIPTION: Composite: . Then Places a black dot at position (21, 249). Then Creates a red circular shape at (196, 161) with radius 39.
; PLAN: r0=21(x), r1=249(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=196(x), r1=161(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (21, 249).
; PLAN: r0=21(x), r1=249(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 249
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a red circular shape at (196, 161) with radius 39.
; PLAN: r0=196(x), r1=161(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 161
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
