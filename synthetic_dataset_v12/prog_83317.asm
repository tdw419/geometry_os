; DESCRIPTION: Creates a orange rectangular region at (379, 141) spanning 73 by 115 pixels.
; PLAN: r0=379(x), r1=141(y), r2=73(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 141
LDI r2, 73
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
