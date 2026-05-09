; DESCRIPTION: Composite: Places a magenta dot at position (442, 15) then Creates a blue circular shape at (121, 178) with radius 60.
; PLAN: r0=442(x), r1=15(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=178(y), r7=60(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 442
LDI r1, 15
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 121
LDI r6, 178
LDI r7, 60
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
