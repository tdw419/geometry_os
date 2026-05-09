; DESCRIPTION: Creates a black rectangular region at (151, 32) spanning 59 by 58 pixels.
; PLAN: r0=151(x), r1=32(y), r2=59(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 32
LDI r2, 59
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
