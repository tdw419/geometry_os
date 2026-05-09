; DESCRIPTION: Creates a black rectangular region at (7, 89) spanning 87 by 12 pixels.
; PLAN: r0=7(x), r1=89(y), r2=87(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 89
LDI r2, 87
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
