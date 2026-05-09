; DESCRIPTION: Composite: Draws a purple rectangle at (231, 2) with width 85 and height 101 then Places a orange dot at position (362, 63).
; PLAN: r0=231(x), r1=2(y), r2=85(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x), r6=63(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 231
LDI r1, 2
LDI r2, 85
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 63
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
