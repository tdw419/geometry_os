; DESCRIPTION: Creates a blue filled rectangle of size 10x18 starting at (56, 42).
; PLAN: r0=56(x), r1=42(y), r2=10(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 42
LDI r2, 10
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
