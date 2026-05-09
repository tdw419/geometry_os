; DESCRIPTION: Creates a yellow rectangular region at (43, 200) spanning 13 by 42 pixels.
; PLAN: r0=43(x), r1=200(y), r2=13(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 200
LDI r2, 13
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
