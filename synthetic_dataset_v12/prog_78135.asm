; DESCRIPTION: Composite: Creates a purple rectangular region at (453, 129) spanning 51 by 34 pixels then Places a green dot at position (186, 64) then Creates a green circular shape at (369, 154) with radius 65.
; PLAN: r0=453(x), r1=129(y), r2=51(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x), r6=64(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=369(x), r11=154(y), r12=65(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 453
LDI r1, 129
LDI r2, 51
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 64
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 369
LDI r11, 154
LDI r12, 65
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
