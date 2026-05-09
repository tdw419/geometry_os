; DESCRIPTION: Creates a purple rectangular region at (109, 21) spanning 28 by 15 pixels.
; PLAN: r0=109(x), r1=21(y), r2=28(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 21
LDI r2, 28
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
