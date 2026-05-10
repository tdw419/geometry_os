; DESCRIPTION: Creates a orange rectangular region at (224, 66) spanning 22 by 79 pixels.
; PLAN: r0=224(x), r1=66(y), r2=22(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 66
LDI r2, 22
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
