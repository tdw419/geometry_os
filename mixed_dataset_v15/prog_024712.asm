; DESCRIPTION: Composite: Places a magenta circle of radius 22 at center (190, 123) then Places a cyan dot at position (29, 122) then Renders a green box of size 108x38 starting at (51, 36).
; PLAN: r0=190(x), r1=123(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x), r6=122(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=51(x), r11=36(y), r12=108(width), r13=38(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 123
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 122
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 51
LDI r11, 36
LDI r12, 108
LDI r13, 38
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
