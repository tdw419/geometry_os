; DESCRIPTION: Composite: Places a orange 30x105 rectangle at position (344, 31) then Sets a single white pixel at (473, 60).
; PLAN: r0=344(x), r1=31(y), r2=30(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=473(x), r6=60(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 344
LDI r1, 31
LDI r2, 30
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 60
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
