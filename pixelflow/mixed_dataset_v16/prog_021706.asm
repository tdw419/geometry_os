; DESCRIPTION: Composite: Places a orange dot at position (418, 67) then Places a white circle of radius 36 at center (366, 62).
; PLAN: r0=418(x), r1=67(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=366(x), r6=62(y), r7=36(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 418
LDI r1, 67
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 366
LDI r6, 62
LDI r7, 36
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
