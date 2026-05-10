; DESCRIPTION: Composite: Draws a orange rectangle at (148, 81) with width 118 and height 44 then Places a purple dot at position (275, 12) then Creates a yellow circular shape at (245, 220) with radius 32.
; PLAN: r0=148(x), r1=81(y), r2=118(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=12(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=245(x), r11=220(y), r12=32(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 148
LDI r1, 81
LDI r2, 118
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 12
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 245
LDI r11, 220
LDI r12, 32
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
