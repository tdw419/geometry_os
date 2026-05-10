; DESCRIPTION: Composite: Places a cyan dot at position (4, 45) then Creates a orange circular shape at (401, 112) with radius 69.
; PLAN: r0=4(x), r1=45(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=401(x), r6=112(y), r7=69(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 4
LDI r1, 45
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 401
LDI r6, 112
LDI r7, 69
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
