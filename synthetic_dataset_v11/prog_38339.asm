; DESCRIPTION: Creates a black rectangular region at (85, 67) spanning 92 by 107 pixels.
; PLAN: r0=85(x), r1=67(y), r2=92(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 67
LDI r2, 92
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
