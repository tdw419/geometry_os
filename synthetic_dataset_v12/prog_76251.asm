; DESCRIPTION: Composite: Draws a orange rectangle at (132, 44) with width 12 and height 99 then Creates a green circular shape at (293, 177) with radius 37.
; PLAN: r0=132(x), r1=44(y), r2=12(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x), r6=177(y), r7=37(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 132
LDI r1, 44
LDI r2, 12
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 177
LDI r7, 37
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
