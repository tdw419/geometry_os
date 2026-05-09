; DESCRIPTION: Creates a black rectangular region at (183, 53) spanning 111 by 25 pixels.
; PLAN: r0=183(x), r1=53(y), r2=111(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 53
LDI r2, 111
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
