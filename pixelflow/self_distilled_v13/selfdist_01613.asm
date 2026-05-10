; DESCRIPTION: Creates a yellow filled rectangle of size 42x63 starting at (100, 171).
; PLAN: r0=100(x), r1=171(y), r2=42(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 171
LDI r2, 42
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
