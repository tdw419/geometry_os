; DESCRIPTION: Composite: Places a red dot at position (437, 127) then Places a blue circle of radius 50 at center (181, 90) then Creates a orange rectangular region at (6, 58) spanning 74 by 107 pixels.
; PLAN: r0=437(x), r1=127(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=181(x), r6=90(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=6(x), r11=58(y), r12=74(width), r13=107(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 437
LDI r1, 127
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 181
LDI r6, 90
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 6
LDI r11, 58
LDI r12, 74
LDI r13, 107
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
