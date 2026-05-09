; DESCRIPTION: Composite: Places a yellow dot at position (419, 89) then Places a black circle of radius 43 at center (420, 46) then Places a purple 86x59 rectangle at position (100, 33).
; PLAN: r0=419(x), r1=89(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=46(y), r7=43(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=100(x), r11=33(y), r12=86(width), r13=59(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 89
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 420
LDI r6, 46
LDI r7, 43
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 100
LDI r11, 33
LDI r12, 86
LDI r13, 59
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
