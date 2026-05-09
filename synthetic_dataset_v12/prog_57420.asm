; DESCRIPTION: Composite: Creates a cyan rectangular region at (48, 132) spanning 116 by 101 pixels then Sets a single cyan pixel at (273, 98).
; PLAN: r0=48(x), r1=132(y), r2=116(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x), r6=98(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 48
LDI r1, 132
LDI r2, 116
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 98
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
