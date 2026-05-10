; DESCRIPTION: Composite: Creates a cyan rectangular region at (391, 41) spanning 104 by 32 pixels then Places a cyan circle of radius 65 at center (139, 99).
; PLAN: r0=391(x), r1=41(y), r2=104(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=139(x), r6=99(y), r7=65(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 391
LDI r1, 41
LDI r2, 104
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 99
LDI r7, 65
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
