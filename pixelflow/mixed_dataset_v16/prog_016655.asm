; DESCRIPTION: Composite: Creates a orange circular shape at (229, 222) with radius 16 then Places a purple dot at position (377, 70).
; PLAN: r0=229(x), r1=222(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x), r6=70(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 229
LDI r1, 222
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 70
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
