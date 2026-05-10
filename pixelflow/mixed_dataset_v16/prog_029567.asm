; DESCRIPTION: Composite: Places a orange dot at position (240, 165) then Renders a white line between points (454, 222) and (92, 179) then Creates a black rectangular region at (96, 62) spanning 62 by 71 pixels.
; PLAN: r0=240(x), r1=165(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=454(x1), r6=222(y1), r7=92(x2), r8=179(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=96(x), r11=62(y), r12=62(width), r13=71(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 240
LDI r1, 165
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 454
LDI r6, 222
LDI r7, 92
LDI r8, 179
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 62
LDI r12, 62
LDI r13, 71
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
