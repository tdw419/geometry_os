; DESCRIPTION: Composite: Creates a green circular shape at (147, 38) with radius 35 then Places a black dot at position (371, 12) then Renders a magenta box of size 50x110 starting at (304, 59).
; PLAN: r0=147(x), r1=38(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=12(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=304(x), r11=59(y), r12=50(width), r13=110(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 38
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 12
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 304
LDI r11, 59
LDI r12, 50
LDI r13, 110
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
