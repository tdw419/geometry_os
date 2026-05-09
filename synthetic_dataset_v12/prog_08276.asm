; DESCRIPTION: Creates a black rectangular region at (488, 157) spanning 16 by 82 pixels.
; PLAN: r0=488(x), r1=157(y), r2=16(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 157
LDI r2, 16
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
