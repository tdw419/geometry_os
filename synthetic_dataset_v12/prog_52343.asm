; DESCRIPTION: Creates a white rectangular region at (93, 137) spanning 68 by 32 pixels.
; PLAN: r0=93(x), r1=137(y), r2=68(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 137
LDI r2, 68
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
