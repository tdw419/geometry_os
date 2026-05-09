; DESCRIPTION: Creates a black rectangular region at (333, 184) spanning 10 by 49 pixels.
; PLAN: r0=333(x), r1=184(y), r2=10(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 184
LDI r2, 10
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
