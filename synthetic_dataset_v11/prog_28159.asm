; DESCRIPTION: Creates a black rectangular region at (50, 100) spanning 118 by 115 pixels.
; PLAN: r0=50(x), r1=100(y), r2=118(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 100
LDI r2, 118
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
