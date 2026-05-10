; DESCRIPTION: Creates a yellow rectangular region at (72, 63) spanning 83 by 10 pixels.
; PLAN: r0=72(x), r1=63(y), r2=83(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 63
LDI r2, 83
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
