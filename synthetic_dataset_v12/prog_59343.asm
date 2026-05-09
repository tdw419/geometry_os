; DESCRIPTION: Creates a blue rectangular region at (376, 109) spanning 30 by 89 pixels.
; PLAN: r0=376(x), r1=109(y), r2=30(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 109
LDI r2, 30
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
