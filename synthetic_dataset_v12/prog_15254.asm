; DESCRIPTION: Composite: Places a black 54x54 rectangle at position (6, 85) then Sets a single yellow pixel at (362, 243) then Creates a orange circular shape at (47, 213) with radius 28.
; PLAN: r0=6(x), r1=85(y), r2=54(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x), r6=243(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=47(x), r11=213(y), r12=28(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 6
LDI r1, 85
LDI r2, 54
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 243
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 47
LDI r11, 213
LDI r12, 28
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
