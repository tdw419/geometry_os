; DESCRIPTION: Creates a black rectangular region at (117, 10) spanning 39 by 85 pixels.
; PLAN: r0=117(x), r1=10(y), r2=39(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 10
LDI r2, 39
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
