; DESCRIPTION: Creates a blue rectangular region at (93, 55) spanning 32 by 73 pixels.
; PLAN: r0=93(x), r1=55(y), r2=32(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 55
LDI r2, 32
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
