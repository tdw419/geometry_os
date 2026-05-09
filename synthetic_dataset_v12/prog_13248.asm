; DESCRIPTION: Composite: Creates a red rectangular region at (70, 20) spanning 109 by 79 pixels then Creates a white circular shape at (393, 83) with radius 42.
; PLAN: r0=70(x), r1=20(y), r2=109(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=393(x), r6=83(y), r7=42(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 70
LDI r1, 20
LDI r2, 109
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 83
LDI r7, 42
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
