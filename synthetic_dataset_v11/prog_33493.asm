; DESCRIPTION: Creates a purple rectangular region at (42, 19) spanning 109 by 87 pixels.
; PLAN: r0=42(x), r1=19(y), r2=109(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 19
LDI r2, 109
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
