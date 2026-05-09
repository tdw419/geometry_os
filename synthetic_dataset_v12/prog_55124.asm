; DESCRIPTION: Composite: Sets a single orange pixel at (148, 234) then Places a red 54x47 rectangle at position (192, 50) then Places a orange circle of radius 72 at center (320, 170).
; PLAN: r0=148(x), r1=234(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=192(x), r6=50(y), r7=54(width), r8=47(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=320(x), r11=170(y), r12=72(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 148
LDI r1, 234
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 192
LDI r6, 50
LDI r7, 54
LDI r8, 47
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 170
LDI r12, 72
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
