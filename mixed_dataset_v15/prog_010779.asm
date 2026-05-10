; DESCRIPTION: Composite: Sets a single magenta pixel at (375, 177) then Creates a black rectangular region at (1, 150) spanning 48 by 49 pixels.
; PLAN: r0=375(x), r1=177(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=1(x), r6=150(y), r7=48(width), r8=49(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 177
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 1
LDI r6, 150
LDI r7, 48
LDI r8, 49
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
