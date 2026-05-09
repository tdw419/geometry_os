; DESCRIPTION: Creates a white rectangular region at (146, 128) spanning 31 by 116 pixels.
; PLAN: r0=146(x), r1=128(y), r2=31(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 128
LDI r2, 31
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
