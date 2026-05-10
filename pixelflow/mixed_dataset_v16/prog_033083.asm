; DESCRIPTION: Creates a yellow rectangular region at (332, 200) spanning 42 by 30 pixels.
; PLAN: r0=332(x), r1=200(y), r2=42(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 200
LDI r2, 42
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
