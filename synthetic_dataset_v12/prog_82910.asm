; DESCRIPTION: Creates a black rectangular region at (32, 14) spanning 113 by 105 pixels.
; PLAN: r0=32(x), r1=14(y), r2=113(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 14
LDI r2, 113
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
