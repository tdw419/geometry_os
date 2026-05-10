; DESCRIPTION: Creates a magenta rectangular region at (203, 86) spanning 50 by 88 pixels.
; PLAN: r0=203(x), r1=86(y), r2=50(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 86
LDI r2, 50
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
