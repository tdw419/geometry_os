; DESCRIPTION: Composite: Renders a yellow line between points (166, 52) and (321, 247) then Creates a orange circular shape at (67, 159) with radius 27 then Places a magenta dot at position (96, 126).
; PLAN: r0=166(x1), r1=52(y1), r2=321(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=67(x), r6=159(y), r7=27(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=96(x), r11=126(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 166
LDI r1, 52
LDI r2, 321
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 159
LDI r7, 27
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 96
LDI r11, 126
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
