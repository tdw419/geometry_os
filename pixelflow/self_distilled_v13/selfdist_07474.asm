; DESCRIPTION: Creates a blue filled rectangle of size 37x42 starting at (266, 2).
; PLAN: r0=266(x), r1=2(y), r2=37(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 2
LDI r2, 37
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
