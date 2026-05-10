; DESCRIPTION: Creates a purple rectangular region at (414, 63) spanning 14 by 39 pixels.
; PLAN: r0=414(x), r1=63(y), r2=14(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 63
LDI r2, 14
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
