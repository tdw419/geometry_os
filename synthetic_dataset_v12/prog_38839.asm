; DESCRIPTION: Composite: Places a black circle of radius 60 at center (343, 115) then Creates a black rectangular region at (288, 100) spanning 77 by 81 pixels.
; PLAN: r0=343(x), r1=115(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x), r6=100(y), r7=77(width), r8=81(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 115
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 100
LDI r7, 77
LDI r8, 81
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
