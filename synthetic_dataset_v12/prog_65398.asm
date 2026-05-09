; DESCRIPTION: Creates a black rectangular region at (182, 189) spanning 31 by 56 pixels.
; PLAN: r0=182(x), r1=189(y), r2=31(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 189
LDI r2, 31
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
