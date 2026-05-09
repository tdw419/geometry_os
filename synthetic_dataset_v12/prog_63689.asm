; DESCRIPTION: Composite: Draws a orange circle centered at (442, 107) with radius 39 then Sets a single orange pixel at (108, 44) then Places a orange 36x75 rectangle at position (56, 14).
; PLAN: r0=442(x), r1=107(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=44(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=56(x), r11=14(y), r12=36(width), r13=75(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 442
LDI r1, 107
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 44
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 56
LDI r11, 14
LDI r12, 36
LDI r13, 75
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
