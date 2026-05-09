; DESCRIPTION: Creates a purple rectangular region at (117, 35) spanning 32 by 93 pixels.
; PLAN: r0=117(x), r1=35(y), r2=32(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 35
LDI r2, 32
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
