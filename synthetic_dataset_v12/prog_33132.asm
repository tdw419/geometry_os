; DESCRIPTION: Creates a black rectangular region at (319, 103) spanning 62 by 63 pixels.
; PLAN: r0=319(x), r1=103(y), r2=62(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 103
LDI r2, 62
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
