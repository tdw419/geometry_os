; DESCRIPTION: Composite: . Then Places a yellow dot at position (150, 32). Then Creates a white circular shape at (184, 207) with radius 46.
; PLAN: r0=150(x), r1=32(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=184(x), r1=207(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (150, 32).
; PLAN: r0=150(x), r1=32(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 32
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a white circular shape at (184, 207) with radius 46.
; PLAN: r0=184(x), r1=207(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 207
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
