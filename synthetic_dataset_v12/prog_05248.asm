; DESCRIPTION: Composite: Renders a orange box of size 19x113 starting at (364, 75) then Places a yellow dot at position (335, 85).
; PLAN: r0=364(x), r1=75(y), r2=19(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x), r6=85(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 364
LDI r1, 75
LDI r2, 19
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 85
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
