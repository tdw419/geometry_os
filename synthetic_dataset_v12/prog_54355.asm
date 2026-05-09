; DESCRIPTION: Creates a black rectangular region at (151, 9) spanning 87 by 10 pixels.
; PLAN: r0=151(x), r1=9(y), r2=87(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 9
LDI r2, 87
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
