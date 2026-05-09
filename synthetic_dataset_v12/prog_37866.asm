; DESCRIPTION: Creates a purple rectangular region at (376, 146) spanning 11 by 62 pixels.
; PLAN: r0=376(x), r1=146(y), r2=11(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 146
LDI r2, 11
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
