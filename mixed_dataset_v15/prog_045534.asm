; DESCRIPTION: Creates a purple rectangular region at (343, 117) spanning 72 by 42 pixels.
; PLAN: r0=343(x), r1=117(y), r2=72(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 117
LDI r2, 72
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
