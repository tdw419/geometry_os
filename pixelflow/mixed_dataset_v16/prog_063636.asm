; DESCRIPTION: Creates a purple rectangular region at (238, 30) spanning 109 by 32 pixels.
; PLAN: r0=238(x), r1=30(y), r2=109(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 30
LDI r2, 109
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
