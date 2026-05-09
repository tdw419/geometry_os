; DESCRIPTION: Composite: Places a white circle of radius 32 at center (394, 52) then Creates a blue rectangular region at (376, 26) spanning 40 by 105 pixels.
; PLAN: r0=394(x), r1=52(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=26(y), r7=40(width), r8=105(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 52
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 26
LDI r7, 40
LDI r8, 105
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
