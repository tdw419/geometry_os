; DESCRIPTION: Creates a black rectangular region at (108, 100) spanning 89 by 52 pixels.
; PLAN: r0=108(x), r1=100(y), r2=89(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 100
LDI r2, 89
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
