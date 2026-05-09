; DESCRIPTION: Creates a magenta circular shape at (174, 82) with radius 23.
; PLAN: r0=174(x), r1=82(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 82
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
