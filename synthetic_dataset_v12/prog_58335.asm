; DESCRIPTION: Creates a black rectangular region at (4, 139) spanning 79 by 64 pixels.
; PLAN: r0=4(x), r1=139(y), r2=79(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 139
LDI r2, 79
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
