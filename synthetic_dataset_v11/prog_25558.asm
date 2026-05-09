; DESCRIPTION: Creates a cyan rectangular region at (19, 116) spanning 22 by 62 pixels.
; PLAN: r0=19(x), r1=116(y), r2=22(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 116
LDI r2, 22
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
