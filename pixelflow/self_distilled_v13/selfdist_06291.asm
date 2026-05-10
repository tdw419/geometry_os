; DESCRIPTION: Creates a blue filled rectangle of size 25x42 starting at (200, 78).
; PLAN: r0=200(x), r1=78(y), r2=25(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 78
LDI r2, 25
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
