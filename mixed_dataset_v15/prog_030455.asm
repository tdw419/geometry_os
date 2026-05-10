; DESCRIPTION: Composite: Creates a blue circular shape at (353, 124) with radius 63 then Places a orange dot at position (295, 13).
; PLAN: r0=353(x), r1=124(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x), r6=13(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 353
LDI r1, 124
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 13
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
