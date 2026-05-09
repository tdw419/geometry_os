; DESCRIPTION: Creates a black rectangular region at (429, 43) spanning 52 by 80 pixels.
; PLAN: r0=429(x), r1=43(y), r2=52(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 43
LDI r2, 52
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
