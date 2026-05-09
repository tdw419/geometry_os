; DESCRIPTION: Composite: . Then Places a black dot at position (176, 117). Then Creates a red circular shape at (168, 65) with radius 14.
; PLAN: r0=176(x), r1=117(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=168(x), r1=65(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (176, 117).
; PLAN: r0=176(x), r1=117(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 117
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a red circular shape at (168, 65) with radius 14.
; PLAN: r0=168(x), r1=65(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 65
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
