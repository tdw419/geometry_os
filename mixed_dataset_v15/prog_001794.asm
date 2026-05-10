; DESCRIPTION: Creates a black rectangular region at (365, 183) spanning 76 by 16 pixels.
; PLAN: r0=365(x), r1=183(y), r2=76(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 183
LDI r2, 76
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
