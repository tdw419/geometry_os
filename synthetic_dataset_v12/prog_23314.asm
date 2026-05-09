; DESCRIPTION: Composite: Creates a white circular shape at (371, 215) with radius 31 then Sets a single orange pixel at (357, 173) then Renders a white box of size 57x80 starting at (428, 122).
; PLAN: r0=371(x), r1=215(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=173(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=428(x), r11=122(y), r12=57(width), r13=80(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 215
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 173
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 428
LDI r11, 122
LDI r12, 57
LDI r13, 80
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
