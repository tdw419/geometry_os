; DESCRIPTION: Composite: Creates a cyan circular shape at (100, 132) with radius 46 then Renders a yellow line between points (343, 166) and (318, 2) then Places a blue 41x55 rectangle at position (466, 183).
; PLAN: r0=100(x), r1=132(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x1), r6=166(y1), r7=318(x2), r8=2(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=466(x), r11=183(y), r12=41(width), r13=55(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 132
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 166
LDI r7, 318
LDI r8, 2
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 183
LDI r12, 41
LDI r13, 55
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
