; DESCRIPTION: Creates a black rectangular region at (111, 194) spanning 81 by 21 pixels.
; PLAN: r0=111(x), r1=194(y), r2=81(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 194
LDI r2, 81
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
