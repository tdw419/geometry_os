; DESCRIPTION: Composite: . Then Places a purple dot at position (39, 32). Then Creates a red circular shape at (104, 127) with radius 68.
; PLAN: r0=39(x), r1=32(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=104(x), r1=127(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (39, 32).
; PLAN: r0=39(x), r1=32(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 32
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a red circular shape at (104, 127) with radius 68.
; PLAN: r0=104(x), r1=127(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 127
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
