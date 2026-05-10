; DESCRIPTION: Composite: Renders a purple disk with center (110, 194) and radius 57 then Places a green dot at position (140, 215) then Creates a yellow rectangular region at (180, 88) spanning 33 by 18 pixels.
; PLAN: r0=110(x), r1=194(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=215(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=180(x), r11=88(y), r12=33(width), r13=18(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 194
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 215
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 180
LDI r11, 88
LDI r12, 33
LDI r13, 18
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
