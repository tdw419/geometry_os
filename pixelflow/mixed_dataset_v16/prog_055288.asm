; DESCRIPTION: Creates a magenta rectangular region at (190, 128) spanning 86 by 99 pixels.
; PLAN: r0=190(x), r1=128(y), r2=86(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 128
LDI r2, 86
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
