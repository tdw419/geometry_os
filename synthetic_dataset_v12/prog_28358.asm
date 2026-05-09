; DESCRIPTION: Composite: Places a magenta dot at position (274, 160) then Draws a white circle centered at (154, 108) with radius 24.
; PLAN: r0=274(x), r1=160(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=154(x), r6=108(y), r7=24(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 274
LDI r1, 160
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 154
LDI r6, 108
LDI r7, 24
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
