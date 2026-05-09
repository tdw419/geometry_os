; DESCRIPTION: Composite: Sets a single black pixel at (11, 58) then Creates a white circular shape at (198, 129) with radius 38 then Creates a white rectangular region at (185, 9) spanning 42 by 103 pixels.
; PLAN: r0=11(x), r1=58(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=198(x), r6=129(y), r7=38(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=185(x), r11=9(y), r12=42(width), r13=103(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 58
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 198
LDI r6, 129
LDI r7, 38
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 185
LDI r11, 9
LDI r12, 42
LDI r13, 103
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
