; DESCRIPTION: Creates a black rectangular region at (263, 134) spanning 76 by 99 pixels.
; PLAN: r0=263(x), r1=134(y), r2=76(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 134
LDI r2, 76
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
