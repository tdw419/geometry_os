; DESCRIPTION: Creates a purple rectangular region at (39, 54) spanning 28 by 93 pixels.
; PLAN: r0=39(x), r1=54(y), r2=28(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 54
LDI r2, 28
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
