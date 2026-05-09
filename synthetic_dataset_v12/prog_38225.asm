; DESCRIPTION: Creates a black rectangular region at (59, 44) spanning 64 by 115 pixels.
; PLAN: r0=59(x), r1=44(y), r2=64(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 44
LDI r2, 64
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
