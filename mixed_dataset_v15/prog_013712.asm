; DESCRIPTION: Creates a magenta rectangular region at (278, 151) spanning 34 by 28 pixels.
; PLAN: r0=278(x), r1=151(y), r2=34(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 151
LDI r2, 34
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
