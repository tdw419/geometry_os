; DESCRIPTION: Composite: Places a cyan dot at position (491, 252) then Renders a purple disk with center (233, 144) and radius 71 then Creates a orange rectangular region at (103, 8) spanning 69 by 102 pixels.
; PLAN: r0=491(x), r1=252(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=233(x), r6=144(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=103(x), r11=8(y), r12=69(width), r13=102(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 491
LDI r1, 252
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 233
LDI r6, 144
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 103
LDI r11, 8
LDI r12, 69
LDI r13, 102
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
