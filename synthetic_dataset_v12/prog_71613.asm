; DESCRIPTION: Creates a blue rectangular region at (224, 66) spanning 95 by 63 pixels.
; PLAN: r0=224(x), r1=66(y), r2=95(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 66
LDI r2, 95
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
