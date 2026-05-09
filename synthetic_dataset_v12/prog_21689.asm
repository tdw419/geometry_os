; DESCRIPTION: Composite: Renders a green disk with center (347, 60) and radius 45 then Sets a single white pixel at (379, 96) then Places a blue 108x10 rectangle at position (321, 146).
; PLAN: r0=347(x), r1=60(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=96(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=321(x), r11=146(y), r12=108(width), r13=10(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 60
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 96
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 321
LDI r11, 146
LDI r12, 108
LDI r13, 10
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
