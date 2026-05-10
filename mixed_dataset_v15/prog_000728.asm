; DESCRIPTION: Composite: Places a purple 101x31 rectangle at position (181, 160) then Sets a single orange pixel at (254, 140).
; PLAN: r0=181(x), r1=160(y), r2=101(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=254(x), r6=140(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 181
LDI r1, 160
LDI r2, 101
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 140
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
