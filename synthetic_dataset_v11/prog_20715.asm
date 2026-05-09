; DESCRIPTION: Creates a purple rectangular region at (151, 42) spanning 87 by 71 pixels.
; PLAN: r0=151(x), r1=42(y), r2=87(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 42
LDI r2, 87
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
