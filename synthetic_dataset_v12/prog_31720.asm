; DESCRIPTION: Composite: Draws a orange rectangle at (335, 196) with width 46 and height 55 then Sets a single green pixel at (127, 97).
; PLAN: r0=335(x), r1=196(y), r2=46(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=97(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 335
LDI r1, 196
LDI r2, 46
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 97
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
