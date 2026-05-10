; DESCRIPTION: Creates a purple rectangular region at (247, 26) spanning 68 by 82 pixels.
; PLAN: r0=247(x), r1=26(y), r2=68(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 26
LDI r2, 68
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
