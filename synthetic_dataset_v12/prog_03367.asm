; DESCRIPTION: Composite: Places a red dot at position (390, 164) then Renders a green disk with center (385, 109) and radius 40 then Creates a magenta rectangular region at (143, 1) spanning 22 by 73 pixels.
; PLAN: r0=390(x), r1=164(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=385(x), r6=109(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=143(x), r11=1(y), r12=22(width), r13=73(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 390
LDI r1, 164
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 385
LDI r6, 109
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 143
LDI r11, 1
LDI r12, 22
LDI r13, 73
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
