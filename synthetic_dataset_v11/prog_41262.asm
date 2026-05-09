; DESCRIPTION: Creates a blue rectangular region at (134, 42) spanning 11 by 43 pixels.
; PLAN: r0=134(x), r1=42(y), r2=11(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 42
LDI r2, 11
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
