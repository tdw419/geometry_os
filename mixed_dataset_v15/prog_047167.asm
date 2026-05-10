; DESCRIPTION: Composite: Creates a magenta rectangular region at (320, 114) spanning 118 by 78 pixels then Sets a single cyan pixel at (348, 219).
; PLAN: r0=320(x), r1=114(y), r2=118(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x), r6=219(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 320
LDI r1, 114
LDI r2, 118
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 219
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
