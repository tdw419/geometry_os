; DESCRIPTION: Creates a black rectangular region at (128, 21) spanning 66 by 95 pixels.
; PLAN: r0=128(x), r1=21(y), r2=66(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 21
LDI r2, 66
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
