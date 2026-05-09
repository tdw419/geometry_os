; DESCRIPTION: Creates a purple rectangular region at (57, 156) spanning 38 by 71 pixels.
; PLAN: r0=57(x), r1=156(y), r2=38(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 156
LDI r2, 38
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
