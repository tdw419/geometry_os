; DESCRIPTION: Creates a purple rectangular region at (54, 73) spanning 34 by 93 pixels.
; PLAN: r0=54(x), r1=73(y), r2=34(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 73
LDI r2, 34
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
