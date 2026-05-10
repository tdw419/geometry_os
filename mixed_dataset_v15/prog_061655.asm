; DESCRIPTION: Composite: Places a magenta 71x69 rectangle at position (218, 37) then Places a orange circle of radius 30 at center (36, 166) then Sets a single orange pixel at (222, 112).
; PLAN: r0=218(x), r1=37(y), r2=71(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x), r6=166(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=222(x), r11=112(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 218
LDI r1, 37
LDI r2, 71
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 166
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 222
LDI r11, 112
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
