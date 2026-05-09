; DESCRIPTION: Creates a cyan rectangular region at (47, 98) spanning 116 by 58 pixels.
; PLAN: r0=47(x), r1=98(y), r2=116(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 98
LDI r2, 116
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
