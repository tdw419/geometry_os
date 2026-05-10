; DESCRIPTION: Composite: Places a green dot at position (393, 166) then Places a green circle of radius 60 at center (321, 69) then Creates a white rectangular region at (70, 85) spanning 66 by 26 pixels.
; PLAN: r0=393(x), r1=166(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=321(x), r6=69(y), r7=60(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=70(x), r11=85(y), r12=66(width), r13=26(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 166
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 321
LDI r6, 69
LDI r7, 60
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 70
LDI r11, 85
LDI r12, 66
LDI r13, 26
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
