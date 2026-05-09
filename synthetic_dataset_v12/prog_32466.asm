; DESCRIPTION: Creates a magenta rectangular region at (341, 99) spanning 39 by 61 pixels.
; PLAN: r0=341(x), r1=99(y), r2=39(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 99
LDI r2, 39
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
