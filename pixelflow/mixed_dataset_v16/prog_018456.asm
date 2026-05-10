; DESCRIPTION: Creates a black rectangular region at (256, 76) spanning 55 by 63 pixels.
; PLAN: r0=256(x), r1=76(y), r2=55(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 76
LDI r2, 55
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
