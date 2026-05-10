; DESCRIPTION: Composite: Draws a orange rectangle at (412, 140) with width 93 and height 79 then Sets a single black pixel at (313, 170).
; PLAN: r0=412(x), r1=140(y), r2=93(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x), r6=170(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 412
LDI r1, 140
LDI r2, 93
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 170
LDI r7, 0x000000
PSET r5, r6, r7
HALT
