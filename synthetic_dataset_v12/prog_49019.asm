; DESCRIPTION: Composite: Creates a orange rectangular region at (333, 47) spanning 116 by 54 pixels then Places a cyan circle of radius 31 at center (139, 163).
; PLAN: r0=333(x), r1=47(y), r2=116(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=139(x), r6=163(y), r7=31(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 333
LDI r1, 47
LDI r2, 116
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 163
LDI r7, 31
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
