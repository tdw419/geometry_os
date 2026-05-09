; DESCRIPTION: Creates a black rectangular region at (384, 166) spanning 96 by 85 pixels.
; PLAN: r0=384(x), r1=166(y), r2=96(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 166
LDI r2, 96
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
