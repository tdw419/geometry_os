; DESCRIPTION: Creates a black rectangular region at (184, 109) spanning 23 by 96 pixels.
; PLAN: r0=184(x), r1=109(y), r2=23(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 109
LDI r2, 23
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
