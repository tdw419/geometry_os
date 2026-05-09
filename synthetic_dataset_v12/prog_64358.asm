; DESCRIPTION: Creates a red rectangular region at (366, 43) spanning 64 by 17 pixels.
; PLAN: r0=366(x), r1=43(y), r2=64(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 43
LDI r2, 64
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
