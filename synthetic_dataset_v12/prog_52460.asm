; DESCRIPTION: Composite: Places a purple 70x41 rectangle at position (44, 119) then Creates a white circular shape at (87, 125) with radius 75.
; PLAN: r0=44(x), r1=119(y), r2=70(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x), r6=125(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 44
LDI r1, 119
LDI r2, 70
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 125
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
