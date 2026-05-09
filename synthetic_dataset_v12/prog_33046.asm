; DESCRIPTION: Creates a purple rectangular region at (261, 42) spanning 102 by 118 pixels.
; PLAN: r0=261(x), r1=42(y), r2=102(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 42
LDI r2, 102
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
