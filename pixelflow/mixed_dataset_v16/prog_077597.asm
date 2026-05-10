; DESCRIPTION: Composite: Creates a blue circular shape at (372, 115) with radius 16 then Creates a purple rectangular region at (283, 82) spanning 45 by 120 pixels.
; PLAN: r0=372(x), r1=115(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=82(y), r7=45(width), r8=120(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 115
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 82
LDI r7, 45
LDI r8, 120
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
