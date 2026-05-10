; DESCRIPTION: Creates a white filled rectangle of size 49x20 starting at (376, 157).
; PLAN: r0=376(x), r1=157(y), r2=49(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 157
LDI r2, 49
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
