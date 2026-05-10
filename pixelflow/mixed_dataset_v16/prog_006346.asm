; DESCRIPTION: Composite: Creates a purple rectangular region at (305, 80) spanning 103 by 61 pixels then Places a white dot at position (339, 20).
; PLAN: r0=305(x), r1=80(y), r2=103(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x), r6=20(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 80
LDI r2, 103
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 20
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
