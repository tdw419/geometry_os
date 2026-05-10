; DESCRIPTION: Composite: Creates a orange rectangular region at (123, 42) spanning 34 by 115 pixels then Places a white circle of radius 58 at center (233, 167).
; PLAN: r0=123(x), r1=42(y), r2=34(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=167(y), r7=58(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 123
LDI r1, 42
LDI r2, 34
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 167
LDI r7, 58
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
