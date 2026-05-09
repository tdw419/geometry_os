; DESCRIPTION: Composite: Draws a orange rectangle at (325, 32) with width 60 and height 89 then Places a green dot at position (45, 61).
; PLAN: r0=325(x), r1=32(y), r2=60(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x), r6=61(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 325
LDI r1, 32
LDI r2, 60
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 61
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
