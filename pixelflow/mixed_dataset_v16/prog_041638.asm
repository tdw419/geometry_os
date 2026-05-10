; DESCRIPTION: Creates a red rectangular region at (325, 170) spanning 82 by 32 pixels.
; PLAN: r0=325(x), r1=170(y), r2=82(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 170
LDI r2, 82
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
