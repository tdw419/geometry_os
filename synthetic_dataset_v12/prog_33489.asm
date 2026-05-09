; DESCRIPTION: Creates a black rectangular region at (34, 10) spanning 60 by 75 pixels.
; PLAN: r0=34(x), r1=10(y), r2=60(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 10
LDI r2, 60
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
