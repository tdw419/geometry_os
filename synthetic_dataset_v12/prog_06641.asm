; DESCRIPTION: Creates a red rectangular region at (381, 67) spanning 46 by 17 pixels.
; PLAN: r0=381(x), r1=67(y), r2=46(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 67
LDI r2, 46
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
