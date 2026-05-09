; DESCRIPTION: Creates a yellow rectangular region at (365, 143) spanning 87 by 78 pixels.
; PLAN: r0=365(x), r1=143(y), r2=87(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 143
LDI r2, 87
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
