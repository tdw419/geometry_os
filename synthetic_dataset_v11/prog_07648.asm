; DESCRIPTION: Creates a white rectangular region at (128, 143) spanning 31 by 67 pixels.
; PLAN: r0=128(x), r1=143(y), r2=31(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 143
LDI r2, 31
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
