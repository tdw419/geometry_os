; DESCRIPTION: Creates a black rectangular region at (102, 82) spanning 28 by 73 pixels.
; PLAN: r0=102(x), r1=82(y), r2=28(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 82
LDI r2, 28
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
