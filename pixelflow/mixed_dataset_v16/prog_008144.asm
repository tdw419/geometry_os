; DESCRIPTION: Composite: Draws a magenta circle centered at (343, 82) with radius 70 then Renders a orange box of size 21x29 starting at (5, 31) then Sets a single green pixel at (458, 142).
; PLAN: r0=343(x), r1=82(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=5(x), r6=31(y), r7=21(width), r8=29(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=458(x), r11=142(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 343
LDI r1, 82
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 5
LDI r6, 31
LDI r7, 21
LDI r8, 29
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 142
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
