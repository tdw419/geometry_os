; DESCRIPTION: Composite: Places a orange circle of radius 25 at center (191, 111) then Creates a magenta rectangular region at (321, 81) spanning 92 by 78 pixels then Places a blue dot at position (18, 142).
; PLAN: r0=191(x), r1=111(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x), r6=81(y), r7=92(width), r8=78(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=18(x), r11=142(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 191
LDI r1, 111
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 81
LDI r7, 92
LDI r8, 78
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 18
LDI r11, 142
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
