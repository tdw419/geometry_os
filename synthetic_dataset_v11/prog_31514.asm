; DESCRIPTION: Creates a black rectangular region at (126, 100) spanning 20 by 44 pixels.
; PLAN: r0=126(x), r1=100(y), r2=20(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 100
LDI r2, 20
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
