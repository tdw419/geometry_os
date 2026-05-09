; DESCRIPTION: Composite: Places a magenta dot at position (66, 63) then Draws a black circle centered at (152, 25) with radius 25.
; PLAN: r0=66(x), r1=63(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=152(x), r6=25(y), r7=25(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 66
LDI r1, 63
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 152
LDI r6, 25
LDI r7, 25
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
