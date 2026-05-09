; DESCRIPTION: Creates a red rectangular region at (379, 65) spanning 99 by 69 pixels.
; PLAN: r0=379(x), r1=65(y), r2=99(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 65
LDI r2, 99
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
