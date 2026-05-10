; DESCRIPTION: Composite: Creates a cyan rectangular region at (118, 15) spanning 14 by 102 pixels then Places a cyan circle of radius 45 at center (435, 200).
; PLAN: r0=118(x), r1=15(y), r2=14(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x), r6=200(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 118
LDI r1, 15
LDI r2, 14
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 200
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
