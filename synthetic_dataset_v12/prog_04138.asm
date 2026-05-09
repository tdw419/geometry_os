; DESCRIPTION: Creates a purple rectangular region at (249, 56) spanning 64 by 56 pixels.
; PLAN: r0=249(x), r1=56(y), r2=64(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 56
LDI r2, 64
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
