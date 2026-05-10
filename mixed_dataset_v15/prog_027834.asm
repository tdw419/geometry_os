; DESCRIPTION: Creates a black rectangular region at (326, 141) spanning 113 by 61 pixels.
; PLAN: r0=326(x), r1=141(y), r2=113(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 141
LDI r2, 113
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
