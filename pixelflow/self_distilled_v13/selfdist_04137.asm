; DESCRIPTION: Creates a yellow filled rectangle of size 42x35 starting at (336, 193).
; PLAN: r0=336(x), r1=193(y), r2=42(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 193
LDI r2, 42
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
