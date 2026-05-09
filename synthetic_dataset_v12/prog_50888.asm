; DESCRIPTION: Creates a blue rectangular region at (376, 150) spanning 73 by 30 pixels.
; PLAN: r0=376(x), r1=150(y), r2=73(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 150
LDI r2, 73
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
