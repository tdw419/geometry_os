; DESCRIPTION: Creates a black rectangular region at (196, 14) spanning 43 by 57 pixels.
; PLAN: r0=196(x), r1=14(y), r2=43(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 14
LDI r2, 43
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
