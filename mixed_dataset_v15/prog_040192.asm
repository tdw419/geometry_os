; DESCRIPTION: Composite: Creates a yellow circular shape at (336, 62) with radius 60 then Creates a purple rectangular region at (393, 98) spanning 108 by 71 pixels then Sets a single white pixel at (321, 55).
; PLAN: r0=336(x), r1=62(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x), r6=98(y), r7=108(width), r8=71(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=321(x), r11=55(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 336
LDI r1, 62
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 98
LDI r7, 108
LDI r8, 71
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 55
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
