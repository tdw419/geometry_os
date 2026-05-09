; DESCRIPTION: Creates a black rectangular region at (60, 46) spanning 90 by 49 pixels.
; PLAN: r0=60(x), r1=46(y), r2=90(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 46
LDI r2, 90
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
