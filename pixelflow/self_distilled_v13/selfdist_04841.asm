; DESCRIPTION: Creates a blue filled rectangle of size 102x55 starting at (158, 42).
; PLAN: r0=158(x), r1=42(y), r2=102(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 42
LDI r2, 102
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
