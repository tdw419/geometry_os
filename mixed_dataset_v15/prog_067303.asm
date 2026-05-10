; DESCRIPTION: Creates a black rectangular region at (101, 40) spanning 12 by 10 pixels.
; PLAN: r0=101(x), r1=40(y), r2=12(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 40
LDI r2, 12
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
