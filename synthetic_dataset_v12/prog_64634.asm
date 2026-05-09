; DESCRIPTION: Composite: Creates a purple rectangular region at (217, 152) spanning 12 by 33 pixels then Draws a cyan circle centered at (210, 40) with radius 31 then Places a orange dot at position (161, 118).
; PLAN: r0=217(x), r1=152(y), r2=12(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x), r6=40(y), r7=31(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=161(x), r11=118(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 217
LDI r1, 152
LDI r2, 12
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 40
LDI r7, 31
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 161
LDI r11, 118
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
