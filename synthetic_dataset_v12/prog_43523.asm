; DESCRIPTION: Creates a purple rectangular region at (276, 156) spanning 48 by 15 pixels.
; PLAN: r0=276(x), r1=156(y), r2=48(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 156
LDI r2, 48
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
