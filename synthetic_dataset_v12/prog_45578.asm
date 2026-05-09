; DESCRIPTION: Creates a purple rectangular region at (37, 140) spanning 83 by 42 pixels.
; PLAN: r0=37(x), r1=140(y), r2=83(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 140
LDI r2, 83
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
