; DESCRIPTION: Composite: Renders a magenta disk with center (417, 85) and radius 36 then Sets a single white pixel at (299, 71) then Renders a black box of size 86x22 starting at (56, 120).
; PLAN: r0=417(x), r1=85(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x), r6=71(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=56(x), r11=120(y), r12=86(width), r13=22(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 85
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 71
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 56
LDI r11, 120
LDI r12, 86
LDI r13, 22
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
