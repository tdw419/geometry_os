; DESCRIPTION: Composite: Creates a orange rectangular region at (377, 16) spanning 11 by 120 pixels then Draws a red circle centered at (83, 107) with radius 11.
; PLAN: r0=377(x), r1=16(y), r2=11(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x), r6=107(y), r7=11(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 377
LDI r1, 16
LDI r2, 11
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 107
LDI r7, 11
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
