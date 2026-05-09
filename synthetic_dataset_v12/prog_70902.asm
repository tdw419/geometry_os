; DESCRIPTION: Creates a black rectangular region at (31, 134) spanning 39 by 64 pixels.
; PLAN: r0=31(x), r1=134(y), r2=39(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 134
LDI r2, 39
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
