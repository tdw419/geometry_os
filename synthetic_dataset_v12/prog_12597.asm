; DESCRIPTION: Composite: Places a purple circle of radius 37 at center (387, 42) then Places a white dot at position (71, 245) then Renders a green box of size 45x112 starting at (222, 5).
; PLAN: r0=387(x), r1=42(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x), r6=245(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=222(x), r11=5(y), r12=45(width), r13=112(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 42
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 245
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 222
LDI r11, 5
LDI r12, 45
LDI r13, 112
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
