; DESCRIPTION: Creates a blue rectangular region at (356, 156) spanning 37 by 42 pixels.
; PLAN: r0=356(x), r1=156(y), r2=37(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 156
LDI r2, 37
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
