; DESCRIPTION: Creates a blue filled rectangle of size 29x46 starting at (184, 42).
; PLAN: r0=184(x), r1=42(y), r2=29(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 42
LDI r2, 29
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
