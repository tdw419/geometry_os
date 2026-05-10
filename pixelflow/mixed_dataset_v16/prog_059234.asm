; DESCRIPTION: Composite: Renders a white box of size 103x112 starting at (393, 117) then Places a black circle of radius 72 at center (122, 159) then Sets a single orange pixel at (382, 208).
; PLAN: r0=393(x), r1=117(y), r2=103(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x), r6=159(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=382(x), r11=208(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 393
LDI r1, 117
LDI r2, 103
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 159
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 382
LDI r11, 208
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
