; DESCRIPTION: Creates a black rectangular region at (474, 131) spanning 36 by 49 pixels.
; PLAN: r0=474(x), r1=131(y), r2=36(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 131
LDI r2, 36
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
