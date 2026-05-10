; DESCRIPTION: Creates a black rectangular region at (171, 11) spanning 28 by 100 pixels.
; PLAN: r0=171(x), r1=11(y), r2=28(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 11
LDI r2, 28
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
