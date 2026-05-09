; DESCRIPTION: Composite: Places a black 64x48 rectangle at position (168, 123) then Sets a single red pixel at (413, 175) then Renders a magenta disk with center (341, 128) and radius 51.
; PLAN: r0=168(x), r1=123(y), r2=64(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x), r6=175(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=341(x), r11=128(y), r12=51(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 168
LDI r1, 123
LDI r2, 64
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 175
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 341
LDI r11, 128
LDI r12, 51
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
