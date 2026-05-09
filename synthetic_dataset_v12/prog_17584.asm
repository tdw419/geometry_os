; DESCRIPTION: Composite: Renders a yellow disk with center (472, 58) and radius 27 then Places a black dot at position (511, 244) then Renders a magenta box of size 109x83 starting at (1, 12).
; PLAN: r0=472(x), r1=58(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=511(x), r6=244(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=1(x), r11=12(y), r12=109(width), r13=83(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 472
LDI r1, 58
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 511
LDI r6, 244
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 1
LDI r11, 12
LDI r12, 109
LDI r13, 83
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
