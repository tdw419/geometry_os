; DESCRIPTION: Composite: Sets a single red pixel at (431, 211) then Creates a orange circular shape at (424, 115) with radius 54 then Creates a blue rectangular region at (377, 11) spanning 61 by 120 pixels.
; PLAN: r0=431(x), r1=211(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=424(x), r6=115(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=377(x), r11=11(y), r12=61(width), r13=120(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 431
LDI r1, 211
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 424
LDI r6, 115
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 377
LDI r11, 11
LDI r12, 61
LDI r13, 120
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
