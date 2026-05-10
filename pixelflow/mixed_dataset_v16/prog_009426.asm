; DESCRIPTION: Composite: Creates a purple rectangular region at (115, 129) spanning 36 by 36 pixels then Places a black dot at position (152, 82) then Draws a orange circle centered at (415, 132) with radius 52.
; PLAN: r0=115(x), r1=129(y), r2=36(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x), r6=82(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=415(x), r11=132(y), r12=52(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 115
LDI r1, 129
LDI r2, 36
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 82
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 415
LDI r11, 132
LDI r12, 52
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
