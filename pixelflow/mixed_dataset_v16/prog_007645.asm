; DESCRIPTION: Composite: Creates a white circular shape at (197, 82) with radius 80 then Creates a blue rectangular region at (153, 1) spanning 107 by 87 pixels.
; PLAN: r0=197(x), r1=82(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x), r6=1(y), r7=107(width), r8=87(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 82
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 1
LDI r7, 107
LDI r8, 87
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
