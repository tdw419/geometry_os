; DESCRIPTION: Composite: Sets a single magenta pixel at (195, 53) then Creates a orange circular shape at (256, 14) with radius 14 then Creates a red rectangular region at (168, 64) spanning 32 by 27 pixels.
; PLAN: r0=195(x), r1=53(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=14(y), r7=14(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=168(x), r11=64(y), r12=32(width), r13=27(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 53
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 256
LDI r6, 14
LDI r7, 14
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 168
LDI r11, 64
LDI r12, 32
LDI r13, 27
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
