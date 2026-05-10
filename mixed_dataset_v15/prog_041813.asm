; DESCRIPTION: Composite: Creates a purple rectangular region at (307, 151) spanning 62 by 76 pixels then Places a orange circle of radius 50 at center (68, 110) then Sets a single white pixel at (400, 80).
; PLAN: r0=307(x), r1=151(y), r2=62(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x), r6=110(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=400(x), r11=80(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 307
LDI r1, 151
LDI r2, 62
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 110
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 400
LDI r11, 80
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
