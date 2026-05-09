; DESCRIPTION: Composite: Creates a orange circular shape at (432, 67) with radius 18 then Places a purple dot at position (150, 138).
; PLAN: r0=432(x), r1=67(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=138(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 432
LDI r1, 67
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 138
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
