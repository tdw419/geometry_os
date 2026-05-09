; DESCRIPTION: Creates a purple rectangular region at (224, 160) spanning 15 by 96 pixels.
; PLAN: r0=224(x), r1=160(y), r2=15(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 160
LDI r2, 15
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
