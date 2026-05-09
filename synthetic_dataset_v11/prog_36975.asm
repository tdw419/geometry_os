; DESCRIPTION: Composite: . Then Creates a blue circular shape at (160, 166) with radius 76. Then Places a magenta dot at position (168, 223).
; PLAN: r0=160(x), r1=166(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=168(x), r1=223(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue circular shape at (160, 166) with radius 76.
; PLAN: r0=160(x), r1=166(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 166
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (168, 223).
; PLAN: r0=168(x), r1=223(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 223
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
