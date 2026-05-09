; DESCRIPTION: Creates a cyan rectangular region at (357, 207) spanning 116 by 43 pixels.
; PLAN: r0=357(x), r1=207(y), r2=116(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 207
LDI r2, 116
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
