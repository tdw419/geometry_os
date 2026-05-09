; DESCRIPTION: Composite: Places a orange circle of radius 53 at center (416, 124) then Places a green dot at position (102, 207) then Creates a magenta rectangular region at (35, 74) spanning 36 by 86 pixels.
; PLAN: r0=416(x), r1=124(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x), r6=207(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=35(x), r11=74(y), r12=36(width), r13=86(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 124
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 207
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 35
LDI r11, 74
LDI r12, 36
LDI r13, 86
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
