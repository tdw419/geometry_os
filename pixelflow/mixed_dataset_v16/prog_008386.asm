; DESCRIPTION: Creates a purple rectangular region at (376, 102) spanning 68 by 28 pixels.
; PLAN: r0=376(x), r1=102(y), r2=68(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 102
LDI r2, 68
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
