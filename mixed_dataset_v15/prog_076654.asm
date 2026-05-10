; DESCRIPTION: Composite: Renders a yellow disk with center (271, 55) and radius 31 then Places a purple dot at position (170, 163) then Creates a cyan rectangular region at (299, 30) spanning 74 by 114 pixels.
; PLAN: r0=271(x), r1=55(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x), r6=163(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=299(x), r11=30(y), r12=74(width), r13=114(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 55
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 163
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 299
LDI r11, 30
LDI r12, 74
LDI r13, 114
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
