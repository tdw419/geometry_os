; DESCRIPTION: Composite: Creates a cyan rectangular region at (58, 26) spanning 106 by 108 pixels then Places a cyan circle of radius 55 at center (328, 189).
; PLAN: r0=58(x), r1=26(y), r2=106(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x), r6=189(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 58
LDI r1, 26
LDI r2, 106
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 189
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
