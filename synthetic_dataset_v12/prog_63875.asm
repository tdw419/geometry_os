; DESCRIPTION: Composite: Places a orange line segment connecting (346, 215) to (380, 165) then Places a white 77x60 rectangle at position (128, 191) then Creates a red circular shape at (354, 37) with radius 34.
; PLAN: r0=346(x1), r1=215(y1), r2=380(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=191(y), r7=77(width), r8=60(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=354(x), r11=37(y), r12=34(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 346
LDI r1, 215
LDI r2, 380
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 191
LDI r7, 77
LDI r8, 60
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 37
LDI r12, 34
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
