; DESCRIPTION: Creates a blue rectangular region at (265, 57) spanning 58 by 30 pixels.
; PLAN: r0=265(x), r1=57(y), r2=58(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 57
LDI r2, 58
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
