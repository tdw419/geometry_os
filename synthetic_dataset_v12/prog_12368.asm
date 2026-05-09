; DESCRIPTION: Composite: Places a black dot at position (217, 152) then Places a cyan circle of radius 63 at center (267, 115) then Creates a cyan rectangular region at (135, 60) spanning 46 by 85 pixels.
; PLAN: r0=217(x), r1=152(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=267(x), r6=115(y), r7=63(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=135(x), r11=60(y), r12=46(width), r13=85(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 152
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 267
LDI r6, 115
LDI r7, 63
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 135
LDI r11, 60
LDI r12, 46
LDI r13, 85
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
