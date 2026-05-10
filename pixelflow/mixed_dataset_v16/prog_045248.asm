; DESCRIPTION: Creates a black rectangular region at (189, 28) spanning 60 by 112 pixels.
; PLAN: r0=189(x), r1=28(y), r2=60(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 28
LDI r2, 60
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
