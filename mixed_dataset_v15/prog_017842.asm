; DESCRIPTION: Composite: Creates a green circular shape at (206, 64) with radius 40 then Places a white dot at position (294, 129) then Creates a black rectangular region at (103, 16) spanning 48 by 116 pixels.
; PLAN: r0=206(x), r1=64(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x), r6=129(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=103(x), r11=16(y), r12=48(width), r13=116(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 206
LDI r1, 64
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 129
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 103
LDI r11, 16
LDI r12, 48
LDI r13, 116
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
