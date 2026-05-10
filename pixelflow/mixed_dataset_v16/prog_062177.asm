; DESCRIPTION: Composite: Places a orange 20x30 rectangle at position (214, 190) then Draws a cyan circle centered at (140, 122) with radius 80.
; PLAN: r0=214(x), r1=190(y), r2=20(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x), r6=122(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 214
LDI r1, 190
LDI r2, 20
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 122
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
