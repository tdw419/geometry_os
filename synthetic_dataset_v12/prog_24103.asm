; DESCRIPTION: Creates a black rectangular region at (396, 14) spanning 48 by 74 pixels.
; PLAN: r0=396(x), r1=14(y), r2=48(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 14
LDI r2, 48
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
