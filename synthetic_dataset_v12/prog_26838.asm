; DESCRIPTION: Creates a black rectangular region at (280, 49) spanning 98 by 82 pixels.
; PLAN: r0=280(x), r1=49(y), r2=98(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 49
LDI r2, 98
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
