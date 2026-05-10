; DESCRIPTION: Creates a purple rectangular region at (50, 12) spanning 32 by 73 pixels.
; PLAN: r0=50(x), r1=12(y), r2=32(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 12
LDI r2, 32
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
