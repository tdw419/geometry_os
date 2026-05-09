; DESCRIPTION: Composite: Creates a cyan rectangular region at (340, 182) spanning 75 by 25 pixels then Creates a green circular shape at (214, 189) with radius 36.
; PLAN: r0=340(x), r1=182(y), r2=75(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=214(x), r6=189(y), r7=36(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 340
LDI r1, 182
LDI r2, 75
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 189
LDI r7, 36
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
