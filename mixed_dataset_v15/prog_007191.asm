; DESCRIPTION: Creates a white filled rectangle of size 32x18 starting at (163, 176).
; PLAN: r0=163(x), r1=176(y), r2=32(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 176
LDI r2, 32
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
