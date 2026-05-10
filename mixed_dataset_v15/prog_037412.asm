; DESCRIPTION: Composite: Draws a green rectangle at (353, 179) with width 101 and height 44 then Sets a single orange pixel at (242, 84).
; PLAN: r0=353(x), r1=179(y), r2=101(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=242(x), r6=84(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 353
LDI r1, 179
LDI r2, 101
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 84
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
