; DESCRIPTION: Composite: Draws a yellow circle centered at (284, 190) with radius 12 then Sets a single red pixel at (410, 192) then Renders a blue box of size 32x29 starting at (431, 43).
; PLAN: r0=284(x), r1=190(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=410(x), r6=192(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=431(x), r11=43(y), r12=32(width), r13=29(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 190
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 410
LDI r6, 192
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 431
LDI r11, 43
LDI r12, 32
LDI r13, 29
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
