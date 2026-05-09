; DESCRIPTION: Creates a purple rectangular region at (18, 42) spanning 119 by 32 pixels.
; PLAN: r0=18(x), r1=42(y), r2=119(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 42
LDI r2, 119
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
