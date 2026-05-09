; DESCRIPTION: Composite: Draws a orange rectangle at (346, 129) with width 71 and height 22 then Sets a single black pixel at (212, 72).
; PLAN: r0=346(x), r1=129(y), r2=71(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=212(x), r6=72(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 346
LDI r1, 129
LDI r2, 71
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 72
LDI r7, 0x000000
PSET r5, r6, r7
HALT
