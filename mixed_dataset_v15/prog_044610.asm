; DESCRIPTION: Creates a yellow filled rectangle of size 42x82 starting at (333, 3).
; PLAN: r0=333(x), r1=3(y), r2=42(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 3
LDI r2, 42
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
