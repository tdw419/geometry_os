; DESCRIPTION: Creates a black rectangular region at (103, 22) spanning 105 by 85 pixels.
; PLAN: r0=103(x), r1=22(y), r2=105(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 22
LDI r2, 105
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
