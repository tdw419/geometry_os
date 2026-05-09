; DESCRIPTION: Composite: Renders a green box of size 58x38 starting at (36, 177) then Creates a orange circular shape at (335, 136) with radius 13 then Places a red dot at position (386, 115).
; PLAN: r0=36(x), r1=177(y), r2=58(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x), r6=136(y), r7=13(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=386(x), r11=115(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 36
LDI r1, 177
LDI r2, 58
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 136
LDI r7, 13
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 386
LDI r11, 115
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
