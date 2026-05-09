; DESCRIPTION: Composite: Creates a red rectangular region at (387, 115) spanning 10 by 29 pixels then Creates a red circular shape at (455, 188) with radius 38.
; PLAN: r0=387(x), r1=115(y), r2=10(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x), r6=188(y), r7=38(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 387
LDI r1, 115
LDI r2, 10
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 188
LDI r7, 38
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
