; DESCRIPTION: Composite: . Then Places a magenta dot at position (168, 246). Then Draws a yellow circle centered at (128, 171) with radius 78.
; PLAN: r0=168(x), r1=246(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=128(x), r1=171(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (168, 246).
; PLAN: r0=168(x), r1=246(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 246
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow circle centered at (128, 171) with radius 78.
; PLAN: r0=128(x), r1=171(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 171
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
