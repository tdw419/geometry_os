; DESCRIPTION: Composite: Creates a red rectangular region at (179, 28) spanning 80 by 25 pixels then Sets a single green pixel at (87, 24).
; PLAN: r0=179(x), r1=28(y), r2=80(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x), r6=24(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 179
LDI r1, 28
LDI r2, 80
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 24
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
