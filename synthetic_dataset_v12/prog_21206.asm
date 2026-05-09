; DESCRIPTION: Creates a yellow rectangular region at (163, 128) spanning 42 by 87 pixels.
; PLAN: r0=163(x), r1=128(y), r2=42(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 128
LDI r2, 42
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
