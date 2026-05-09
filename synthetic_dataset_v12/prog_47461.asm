; DESCRIPTION: Creates a red rectangular region at (379, 19) spanning 85 by 59 pixels.
; PLAN: r0=379(x), r1=19(y), r2=85(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 19
LDI r2, 85
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
