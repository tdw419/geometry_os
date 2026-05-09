; DESCRIPTION: Creates a black rectangular region at (134, 196) spanning 95 by 30 pixels.
; PLAN: r0=134(x), r1=196(y), r2=95(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 196
LDI r2, 95
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
