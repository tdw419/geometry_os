; DESCRIPTION: Composite: Creates a red rectangular region at (276, 67) spanning 120 by 117 pixels then Sets a single green pixel at (281, 126).
; PLAN: r0=276(x), r1=67(y), r2=120(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x), r6=126(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 276
LDI r1, 67
LDI r2, 120
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 126
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
