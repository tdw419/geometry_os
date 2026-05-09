; DESCRIPTION: Creates a magenta rectangular region at (128, 190) spanning 52 by 15 pixels.
; PLAN: r0=128(x), r1=190(y), r2=52(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 190
LDI r2, 52
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
