; DESCRIPTION: Creates a cyan rectangular region at (379, 71) spanning 72 by 43 pixels.
; PLAN: r0=379(x), r1=71(y), r2=72(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 71
LDI r2, 72
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
