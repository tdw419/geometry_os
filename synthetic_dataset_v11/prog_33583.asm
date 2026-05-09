; DESCRIPTION: Composite: . Then Places a black dot at position (82, 112). Then Draws a magenta circle centered at (154, 97) with radius 79.
; PLAN: r0=82(x), r1=112(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=154(x), r1=97(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (82, 112).
; PLAN: r0=82(x), r1=112(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 112
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta circle centered at (154, 97) with radius 79.
; PLAN: r0=154(x), r1=97(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 97
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
