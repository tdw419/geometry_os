; DESCRIPTION: Creates a green rectangular region at (312, 108) spanning 42 by 86 pixels.
; PLAN: r0=312(x), r1=108(y), r2=42(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 108
LDI r2, 42
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
