; DESCRIPTION: Composite: Creates a white rectangular region at (210, 121) spanning 41 by 70 pixels then Places a purple circle of radius 60 at center (376, 174).
; PLAN: r0=210(x), r1=121(y), r2=41(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=376(x), r6=174(y), r7=60(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 210
LDI r1, 121
LDI r2, 41
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 174
LDI r7, 60
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
