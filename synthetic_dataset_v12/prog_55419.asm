; DESCRIPTION: Creates a purple rectangular region at (203, 64) spanning 50 by 58 pixels.
; PLAN: r0=203(x), r1=64(y), r2=50(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 64
LDI r2, 50
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
