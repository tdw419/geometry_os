; DESCRIPTION: Creates a yellow rectangular region at (140, 67) spanning 63 by 83 pixels.
; PLAN: r0=140(x), r1=67(y), r2=63(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 67
LDI r2, 63
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
