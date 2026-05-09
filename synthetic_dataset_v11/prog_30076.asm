; DESCRIPTION: Creates a yellow rectangular region at (32, 67) spanning 67 by 102 pixels.
; PLAN: r0=32(x), r1=67(y), r2=67(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 67
LDI r2, 67
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
