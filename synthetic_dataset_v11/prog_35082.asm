; DESCRIPTION: Creates a black rectangular region at (83, 128) spanning 59 by 24 pixels.
; PLAN: r0=83(x), r1=128(y), r2=59(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 128
LDI r2, 59
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
