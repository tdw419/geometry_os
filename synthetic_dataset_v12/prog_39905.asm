; DESCRIPTION: Creates a yellow rectangular region at (14, 119) spanning 42 by 72 pixels.
; PLAN: r0=14(x), r1=119(y), r2=42(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 119
LDI r2, 42
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
