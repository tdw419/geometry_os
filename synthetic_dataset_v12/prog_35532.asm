; DESCRIPTION: Creates a white rectangular region at (379, 137) spanning 69 by 68 pixels.
; PLAN: r0=379(x), r1=137(y), r2=69(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 137
LDI r2, 69
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
