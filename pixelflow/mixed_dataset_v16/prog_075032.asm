; DESCRIPTION: Composite: Creates a red circular shape at (340, 153) with radius 76 then Draws a purple rectangle at (178, 126) with width 102 and height 102.
; PLAN: r0=340(x), r1=153(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=178(x), r6=126(y), r7=102(width), r8=102(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 153
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 178
LDI r6, 126
LDI r7, 102
LDI r8, 102
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
