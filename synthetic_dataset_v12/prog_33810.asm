; DESCRIPTION: Creates a black rectangular region at (329, 64) spanning 105 by 113 pixels.
; PLAN: r0=329(x), r1=64(y), r2=105(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 64
LDI r2, 105
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
