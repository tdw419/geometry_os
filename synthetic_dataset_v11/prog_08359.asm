; DESCRIPTION: Creates a yellow rectangular region at (181, 86) spanning 72 by 68 pixels.
; PLAN: r0=181(x), r1=86(y), r2=72(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 86
LDI r2, 72
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
