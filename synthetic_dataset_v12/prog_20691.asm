; DESCRIPTION: Composite: Places a magenta circle of radius 48 at center (68, 97) then Sets a single purple pixel at (135, 86) then Places a cyan 15x40 rectangle at position (369, 102).
; PLAN: r0=68(x), r1=97(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x), r6=86(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=369(x), r11=102(y), r12=15(width), r13=40(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 68
LDI r1, 97
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 86
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 369
LDI r11, 102
LDI r12, 15
LDI r13, 40
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
