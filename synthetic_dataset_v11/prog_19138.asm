; DESCRIPTION: Creates a purple rectangular region at (64, 47) spanning 52 by 49 pixels.
; PLAN: r0=64(x), r1=47(y), r2=52(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 47
LDI r2, 52
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
