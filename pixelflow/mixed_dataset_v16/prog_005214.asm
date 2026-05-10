; DESCRIPTION: Composite: Places a black circle of radius 14 at center (103, 125) then Creates a orange rectangular region at (53, 152) spanning 21 by 102 pixels.
; PLAN: r0=103(x), r1=125(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=152(y), r7=21(width), r8=102(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 125
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 152
LDI r7, 21
LDI r8, 102
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
