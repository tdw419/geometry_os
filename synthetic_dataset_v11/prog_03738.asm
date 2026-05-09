; DESCRIPTION: Creates a purple rectangular region at (60, 84) spanning 23 by 93 pixels.
; PLAN: r0=60(x), r1=84(y), r2=23(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 84
LDI r2, 23
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
