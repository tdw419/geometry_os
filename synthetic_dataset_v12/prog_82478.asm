; DESCRIPTION: Composite: Creates a red rectangular region at (102, 65) spanning 28 by 76 pixels then Places a purple circle of radius 50 at center (208, 183).
; PLAN: r0=102(x), r1=65(y), r2=28(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=183(y), r7=50(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 102
LDI r1, 65
LDI r2, 28
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 183
LDI r7, 50
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
