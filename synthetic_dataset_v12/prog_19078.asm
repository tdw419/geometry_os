; DESCRIPTION: Creates a yellow rectangular region at (47, 128) spanning 31 by 95 pixels.
; PLAN: r0=47(x), r1=128(y), r2=31(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 128
LDI r2, 31
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
