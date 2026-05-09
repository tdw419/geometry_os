; DESCRIPTION: Composite: Places a green circle of radius 23 at center (34, 76) then Sets a single cyan pixel at (288, 201) then Places a orange 55x61 rectangle at position (289, 135).
; PLAN: r0=34(x), r1=76(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x), r6=201(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=289(x), r11=135(y), r12=55(width), r13=61(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 76
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 201
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 289
LDI r11, 135
LDI r12, 55
LDI r13, 61
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
