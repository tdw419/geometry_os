; DESCRIPTION: Composite: Draws a orange rectangle at (304, 89) with width 118 and height 39 then Places a orange dot at position (19, 120) then Creates a magenta circular shape at (286, 217) with radius 36.
; PLAN: r0=304(x), r1=89(y), r2=118(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x), r6=120(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=286(x), r11=217(y), r12=36(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 304
LDI r1, 89
LDI r2, 118
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 120
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 286
LDI r11, 217
LDI r12, 36
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
