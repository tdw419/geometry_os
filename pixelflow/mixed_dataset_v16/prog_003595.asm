; DESCRIPTION: Creates a green rectangular region at (42, 14) spanning 105 by 87 pixels.
; PLAN: r0=42(x), r1=14(y), r2=105(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 14
LDI r2, 105
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
