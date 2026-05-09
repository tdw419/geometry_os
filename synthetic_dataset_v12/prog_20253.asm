; DESCRIPTION: Creates a black rectangular region at (255, 56) spanning 41 by 61 pixels.
; PLAN: r0=255(x), r1=56(y), r2=41(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 56
LDI r2, 41
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
