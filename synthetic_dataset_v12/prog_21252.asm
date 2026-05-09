; DESCRIPTION: Creates a purple rectangular region at (57, 12) spanning 15 by 93 pixels.
; PLAN: r0=57(x), r1=12(y), r2=15(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 12
LDI r2, 15
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
