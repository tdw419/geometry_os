; DESCRIPTION: Creates a white rectangular region at (384, 67) spanning 28 by 58 pixels.
; PLAN: r0=384(x), r1=67(y), r2=28(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 67
LDI r2, 28
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
