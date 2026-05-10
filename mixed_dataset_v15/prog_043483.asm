; DESCRIPTION: Creates a black rectangular region at (131, 12) spanning 72 by 36 pixels.
; PLAN: r0=131(x), r1=12(y), r2=72(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 12
LDI r2, 72
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
