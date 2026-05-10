; DESCRIPTION: Creates a black rectangular region at (396, 107) spanning 64 by 99 pixels.
; PLAN: r0=396(x), r1=107(y), r2=64(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 107
LDI r2, 64
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
