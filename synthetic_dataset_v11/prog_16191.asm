; DESCRIPTION: Creates a purple rectangular region at (210, 92) spanning 24 by 55 pixels.
; PLAN: r0=210(x), r1=92(y), r2=24(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 92
LDI r2, 24
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
