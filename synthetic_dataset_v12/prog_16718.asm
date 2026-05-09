; DESCRIPTION: Composite: Creates a white rectangular region at (206, 43) spanning 108 by 103 pixels then Sets a single white pixel at (385, 40) then Places a white circle of radius 47 at center (135, 146).
; PLAN: r0=206(x), r1=43(y), r2=108(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x), r6=40(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=135(x), r11=146(y), r12=47(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 206
LDI r1, 43
LDI r2, 108
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 40
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 135
LDI r11, 146
LDI r12, 47
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
