; DESCRIPTION: Creates a purple rectangular region at (265, 42) spanning 82 by 102 pixels.
; PLAN: r0=265(x), r1=42(y), r2=82(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 42
LDI r2, 82
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
