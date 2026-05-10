; DESCRIPTION: Composite: Creates a white rectangular region at (14, 15) spanning 74 by 80 pixels then Sets a single red pixel at (445, 8).
; PLAN: r0=14(x), r1=15(y), r2=74(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x), r6=8(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 14
LDI r1, 15
LDI r2, 74
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 8
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
