; DESCRIPTION: Composite: Places a orange circle of radius 73 at center (303, 171) then Creates a orange rectangular region at (23, 124) spanning 43 by 72 pixels then Sets a single magenta pixel at (299, 165).
; PLAN: r0=303(x), r1=171(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=23(x), r6=124(y), r7=43(width), r8=72(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=299(x), r11=165(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 303
LDI r1, 171
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 23
LDI r6, 124
LDI r7, 43
LDI r8, 72
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 165
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
