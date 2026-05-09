; DESCRIPTION: Composite: Creates a black circular shape at (273, 172) with radius 41 then Places a magenta dot at position (392, 179).
; PLAN: r0=273(x), r1=172(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x), r6=179(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 273
LDI r1, 172
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 179
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
