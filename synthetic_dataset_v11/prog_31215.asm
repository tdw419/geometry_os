; DESCRIPTION: Composite: . Then Places a magenta dot at position (206, 184). Then Creates a black circular shape at (81, 133) with radius 42.
; PLAN: r0=206(x), r1=184(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=81(x), r1=133(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (206, 184).
; PLAN: r0=206(x), r1=184(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 206
LDI r1, 184
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a black circular shape at (81, 133) with radius 42.
; PLAN: r0=81(x), r1=133(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 133
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
