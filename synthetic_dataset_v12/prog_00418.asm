; DESCRIPTION: Composite: Places a orange dot at position (251, 92) then Creates a white circular shape at (220, 218) with radius 28 then Renders a yellow box of size 54x12 starting at (283, 233).
; PLAN: r0=251(x), r1=92(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=220(x), r6=218(y), r7=28(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=283(x), r11=233(y), r12=54(width), r13=12(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 92
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 220
LDI r6, 218
LDI r7, 28
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 283
LDI r11, 233
LDI r12, 54
LDI r13, 12
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
