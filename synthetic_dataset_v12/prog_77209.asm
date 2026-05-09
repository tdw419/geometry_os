; DESCRIPTION: Composite: Sets a single orange pixel at (242, 33) then Draws a white circle centered at (130, 181) with radius 63.
; PLAN: r0=242(x), r1=33(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=181(y), r7=63(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 242
LDI r1, 33
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 130
LDI r6, 181
LDI r7, 63
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
