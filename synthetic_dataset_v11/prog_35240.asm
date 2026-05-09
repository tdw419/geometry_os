; DESCRIPTION: Creates a blue rectangular region at (61, 101) spanning 24 by 68 pixels.
; PLAN: r0=61(x), r1=101(y), r2=24(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 101
LDI r2, 24
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
