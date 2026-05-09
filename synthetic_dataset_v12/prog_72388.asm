; DESCRIPTION: Composite: Draws a blue rectangle at (46, 40) with width 98 and height 114 then Sets a single orange pixel at (471, 76).
; PLAN: r0=46(x), r1=40(y), r2=98(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=471(x), r6=76(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 46
LDI r1, 40
LDI r2, 98
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 76
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
