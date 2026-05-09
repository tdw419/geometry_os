; DESCRIPTION: Creates a purple rectangular region at (73, 113) spanning 14 by 93 pixels.
; PLAN: r0=73(x), r1=113(y), r2=14(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 113
LDI r2, 14
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
