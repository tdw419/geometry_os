; DESCRIPTION: Creates a purple rectangular region at (353, 146) spanning 73 by 14 pixels.
; PLAN: r0=353(x), r1=146(y), r2=73(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 146
LDI r2, 73
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
