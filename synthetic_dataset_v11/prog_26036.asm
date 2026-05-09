; DESCRIPTION: Creates a blue rectangular region at (131, 13) spanning 82 by 83 pixels.
; PLAN: r0=131(x), r1=13(y), r2=82(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 13
LDI r2, 82
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
