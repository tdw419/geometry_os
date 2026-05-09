; DESCRIPTION: Creates a magenta rectangular region at (224, 43) spanning 22 by 63 pixels.
; PLAN: r0=224(x), r1=43(y), r2=22(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 43
LDI r2, 22
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
