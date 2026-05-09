; DESCRIPTION: Composite: Places a magenta dot at position (228, 254) then Draws a blue circle centered at (160, 177) with radius 69.
; PLAN: r0=228(x), r1=254(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=160(x), r6=177(y), r7=69(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 228
LDI r1, 254
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 160
LDI r6, 177
LDI r7, 69
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
