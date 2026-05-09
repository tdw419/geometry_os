; DESCRIPTION: Composite: Sets a single blue pixel at (196, 21) then Creates a cyan circular shape at (202, 133) with radius 37 then Creates a red rectangular region at (254, 3) spanning 117 by 42 pixels.
; PLAN: r0=196(x), r1=21(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=133(y), r7=37(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=254(x), r11=3(y), r12=117(width), r13=42(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 21
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 133
LDI r7, 37
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 254
LDI r11, 3
LDI r12, 117
LDI r13, 42
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
