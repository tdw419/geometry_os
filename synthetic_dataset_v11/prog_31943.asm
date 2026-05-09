; DESCRIPTION: Composite: . Then Places a magenta dot at position (176, 189). Then Draws a magenta circle centered at (161, 142) with radius 50.
; PLAN: r0=176(x), r1=189(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=161(x), r1=142(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (176, 189).
; PLAN: r0=176(x), r1=189(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 189
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta circle centered at (161, 142) with radius 50.
; PLAN: r0=161(x), r1=142(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 142
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
