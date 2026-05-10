; DESCRIPTION: Creates a black rectangular region at (361, 162) spanning 52 by 84 pixels.
; PLAN: r0=361(x), r1=162(y), r2=52(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 162
LDI r2, 52
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
