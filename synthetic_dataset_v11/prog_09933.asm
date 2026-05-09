; DESCRIPTION: Creates a black rectangular region at (0, 61) spanning 68 by 100 pixels.
; PLAN: r0=0(x), r1=61(y), r2=68(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 61
LDI r2, 68
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
