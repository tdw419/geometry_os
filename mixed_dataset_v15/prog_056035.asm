; DESCRIPTION: Composite: Renders a orange line between points (490, 213) and (71, 204) then Creates a red rectangular region at (62, 135) spanning 13 by 62 pixels then Places a orange dot at position (458, 64).
; PLAN: r0=490(x1), r1=213(y1), r2=71(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=135(y), r7=13(width), r8=62(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=458(x), r11=64(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 490
LDI r1, 213
LDI r2, 71
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 135
LDI r7, 13
LDI r8, 62
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 64
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
