; DESCRIPTION: Creates a yellow rectangular region at (136, 117) spanning 14 by 42 pixels.
; PLAN: r0=136(x), r1=117(y), r2=14(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 117
LDI r2, 14
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
