; DESCRIPTION: Composite: Creates a blue circular shape at (414, 98) with radius 40 then Creates a cyan rectangular region at (292, 25) spanning 103 by 80 pixels.
; PLAN: r0=414(x), r1=98(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x), r6=25(y), r7=103(width), r8=80(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 98
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 25
LDI r7, 103
LDI r8, 80
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
