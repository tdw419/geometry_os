; DESCRIPTION: Composite: Places a white 116x110 rectangle at position (85, 41) then Sets a single red pixel at (220, 130).
; PLAN: r0=85(x), r1=41(y), r2=116(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x), r6=130(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 85
LDI r1, 41
LDI r2, 116
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 130
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
