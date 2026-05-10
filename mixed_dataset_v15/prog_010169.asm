; DESCRIPTION: Composite: Places a purple circle of radius 63 at center (393, 163) then Places a white dot at position (394, 100) then Places a white 24x119 rectangle at position (62, 99).
; PLAN: r0=393(x), r1=163(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=394(x), r6=100(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=62(x), r11=99(y), r12=24(width), r13=119(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 163
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 394
LDI r6, 100
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 62
LDI r11, 99
LDI r12, 24
LDI r13, 119
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
