; DESCRIPTION: Creates a purple rectangular region at (73, 73) spanning 61 by 22 pixels.
; PLAN: r0=73(x), r1=73(y), r2=61(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 73
LDI r2, 61
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
