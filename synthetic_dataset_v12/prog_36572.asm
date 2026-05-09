; DESCRIPTION: Creates a yellow rectangular region at (338, 61) spanning 15 by 63 pixels.
; PLAN: r0=338(x), r1=61(y), r2=15(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 61
LDI r2, 15
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
