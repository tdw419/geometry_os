; DESCRIPTION: Creates a yellow filled rectangle of size 38x53 starting at (42, 83).
; PLAN: r0=42(x), r1=83(y), r2=38(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 83
LDI r2, 38
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
