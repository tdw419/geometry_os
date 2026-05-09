; DESCRIPTION: Creates a blue rectangular region at (122, 143) spanning 103 by 28 pixels.
; PLAN: r0=122(x), r1=143(y), r2=103(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 143
LDI r2, 103
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
