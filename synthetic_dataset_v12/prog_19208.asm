; DESCRIPTION: Composite: Creates a cyan rectangular region at (72, 11) spanning 58 by 93 pixels then Places a white circle of radius 80 at center (185, 159).
; PLAN: r0=72(x), r1=11(y), r2=58(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x), r6=159(y), r7=80(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 72
LDI r1, 11
LDI r2, 58
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 159
LDI r7, 80
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
