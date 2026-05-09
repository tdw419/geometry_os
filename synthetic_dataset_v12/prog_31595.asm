; DESCRIPTION: Creates a purple rectangular region at (57, 28) spanning 93 by 29 pixels.
; PLAN: r0=57(x), r1=28(y), r2=93(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 28
LDI r2, 93
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
