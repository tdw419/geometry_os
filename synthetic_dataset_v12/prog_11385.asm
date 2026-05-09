; DESCRIPTION: Creates a purple rectangular region at (406, 156) spanning 93 by 78 pixels.
; PLAN: r0=406(x), r1=156(y), r2=93(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 156
LDI r2, 93
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
