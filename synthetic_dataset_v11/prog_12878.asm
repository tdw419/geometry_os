; DESCRIPTION: Creates a purple rectangular region at (57, 73) spanning 98 by 92 pixels.
; PLAN: r0=57(x), r1=73(y), r2=98(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 73
LDI r2, 98
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
