; DESCRIPTION: Creates a purple rectangular region at (389, 185) spanning 56 by 42 pixels.
; PLAN: r0=389(x), r1=185(y), r2=56(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 185
LDI r2, 56
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
