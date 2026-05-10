; DESCRIPTION: Creates a black rectangular region at (310, 33) spanning 64 by 74 pixels.
; PLAN: r0=310(x), r1=33(y), r2=64(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 33
LDI r2, 64
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
