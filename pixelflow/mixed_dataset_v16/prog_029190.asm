; DESCRIPTION: Composite: Sets a single cyan pixel at (142, 245) then Creates a yellow circular shape at (372, 217) with radius 23 then Places a cyan 75x109 rectangle at position (374, 16).
; PLAN: r0=142(x), r1=245(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=217(y), r7=23(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=374(x), r11=16(y), r12=75(width), r13=109(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 245
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 372
LDI r6, 217
LDI r7, 23
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 374
LDI r11, 16
LDI r12, 75
LDI r13, 109
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
