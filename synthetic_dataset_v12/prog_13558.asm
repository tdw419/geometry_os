; DESCRIPTION: Composite: Draws a yellow circle centered at (154, 118) with radius 39 then Places a red dot at position (422, 119) then Creates a purple rectangular region at (240, 44) spanning 111 by 74 pixels.
; PLAN: r0=154(x), r1=118(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=119(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=240(x), r11=44(y), r12=111(width), r13=74(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 118
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 119
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 240
LDI r11, 44
LDI r12, 111
LDI r13, 74
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
