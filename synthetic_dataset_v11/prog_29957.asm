; DESCRIPTION: Creates a cyan rectangular region at (88, 56) spanning 67 by 57 pixels.
; PLAN: r0=88(x), r1=56(y), r2=67(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 56
LDI r2, 67
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
