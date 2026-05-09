; DESCRIPTION: Composite: Renders a green line between points (336, 152) and (265, 213) then Places a black circle of radius 29 at center (393, 162) then Creates a purple rectangular region at (289, 82) spanning 107 by 80 pixels.
; PLAN: r0=336(x1), r1=152(y1), r2=265(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=393(x), r6=162(y), r7=29(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=289(x), r11=82(y), r12=107(width), r13=80(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 152
LDI r2, 265
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 162
LDI r7, 29
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 289
LDI r11, 82
LDI r12, 107
LDI r13, 80
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
