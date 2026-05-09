; DESCRIPTION: Draws a green circle centered at (342, 103) with radius 42.
; PLAN: r0=342(x), r1=103(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 103
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
