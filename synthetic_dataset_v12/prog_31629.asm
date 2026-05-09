; DESCRIPTION: Creates a black rectangular region at (80, 101) spanning 63 by 98 pixels.
; PLAN: r0=80(x), r1=101(y), r2=63(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 101
LDI r2, 63
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
