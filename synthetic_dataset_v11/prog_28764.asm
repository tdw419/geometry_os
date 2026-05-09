; DESCRIPTION: Creates a cyan rectangular region at (29, 92) spanning 58 by 88 pixels.
; PLAN: r0=29(x), r1=92(y), r2=58(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 92
LDI r2, 58
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
