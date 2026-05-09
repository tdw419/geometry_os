; DESCRIPTION: Creates a white rectangular region at (101, 128) spanning 38 by 49 pixels.
; PLAN: r0=101(x), r1=128(y), r2=38(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 128
LDI r2, 38
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
