; DESCRIPTION: Composite: Creates a cyan circular shape at (107, 87) with radius 69 then Sets a single purple pixel at (319, 154) then Renders a yellow box of size 114x108 starting at (368, 103).
; PLAN: r0=107(x), r1=87(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=319(x), r6=154(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=368(x), r11=103(y), r12=114(width), r13=108(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 87
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 319
LDI r6, 154
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 368
LDI r11, 103
LDI r12, 114
LDI r13, 108
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
