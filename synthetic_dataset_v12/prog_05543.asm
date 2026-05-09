; DESCRIPTION: Composite: Sets a single magenta pixel at (118, 135) then Creates a blue circular shape at (131, 88) with radius 57 then Creates a black rectangular region at (295, 100) spanning 70 by 61 pixels.
; PLAN: r0=118(x), r1=135(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=88(y), r7=57(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=295(x), r11=100(y), r12=70(width), r13=61(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 135
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 131
LDI r6, 88
LDI r7, 57
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 295
LDI r11, 100
LDI r12, 70
LDI r13, 61
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
