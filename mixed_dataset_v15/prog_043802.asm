; DESCRIPTION: Composite: Places a green 15x67 rectangle at position (214, 36) then Sets a single black pixel at (154, 84) then Places a magenta circle of radius 62 at center (187, 167).
; PLAN: r0=214(x), r1=36(y), r2=15(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x), r6=84(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=187(x), r11=167(y), r12=62(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 214
LDI r1, 36
LDI r2, 15
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 84
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 187
LDI r11, 167
LDI r12, 62
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
