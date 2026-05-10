; DESCRIPTION: Creates a cyan rectangular region at (431, 36) spanning 28 by 116 pixels.
; PLAN: r0=431(x), r1=36(y), r2=28(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 36
LDI r2, 28
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
