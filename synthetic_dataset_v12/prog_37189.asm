; DESCRIPTION: Composite: Places a magenta dot at position (313, 72) then Draws a black circle centered at (222, 142) with radius 20.
; PLAN: r0=313(x), r1=72(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=222(x), r6=142(y), r7=20(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 313
LDI r1, 72
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 222
LDI r6, 142
LDI r7, 20
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
