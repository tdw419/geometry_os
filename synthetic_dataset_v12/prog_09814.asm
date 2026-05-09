; DESCRIPTION: Composite: Draws a red circle centered at (258, 55) with radius 51 then Places a cyan 56x78 rectangle at position (224, 92).
; PLAN: r0=258(x), r1=55(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=224(x), r6=92(y), r7=56(width), r8=78(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 55
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 224
LDI r6, 92
LDI r7, 56
LDI r8, 78
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
