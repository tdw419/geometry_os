; DESCRIPTION: Creates a blue rectangular region at (287, 128) spanning 82 by 92 pixels.
; PLAN: r0=287(x), r1=128(y), r2=82(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 128
LDI r2, 82
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
