; DESCRIPTION: Composite: Creates a green circular shape at (98, 119) with radius 40 then Creates a red rectangular region at (179, 114) spanning 42 by 38 pixels.
; PLAN: r0=98(x), r1=119(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x), r6=114(y), r7=42(width), r8=38(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 119
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 114
LDI r7, 42
LDI r8, 38
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
