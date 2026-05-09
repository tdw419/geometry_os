; DESCRIPTION: Creates a black rectangular region at (25, 179) spanning 25 by 71 pixels.
; PLAN: r0=25(x), r1=179(y), r2=25(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 179
LDI r2, 25
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
