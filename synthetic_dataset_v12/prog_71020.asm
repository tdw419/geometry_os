; DESCRIPTION: Creates a black rectangular region at (90, 112) spanning 67 by 115 pixels.
; PLAN: r0=90(x), r1=112(y), r2=67(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 112
LDI r2, 67
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
