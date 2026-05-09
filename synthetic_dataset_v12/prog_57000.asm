; DESCRIPTION: Composite: Renders a purple disk with center (346, 143) and radius 50 then Places a blue dot at position (409, 225) then Creates a yellow rectangular region at (153, 118) spanning 19 by 65 pixels.
; PLAN: r0=346(x), r1=143(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=225(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=153(x), r11=118(y), r12=19(width), r13=65(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 346
LDI r1, 143
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 225
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 153
LDI r11, 118
LDI r12, 19
LDI r13, 65
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
