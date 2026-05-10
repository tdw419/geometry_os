; DESCRIPTION: Creates a yellow filled rectangle of size 42x24 starting at (50, 69).
; PLAN: r0=50(x), r1=69(y), r2=42(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 69
LDI r2, 42
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
