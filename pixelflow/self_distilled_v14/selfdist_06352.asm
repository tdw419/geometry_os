; DESCRIPTION: Creates a yellow filled rectangle of size 83x84 starting at (168, 14).
; PLAN: r0=168(x), r1=14(y), r2=83(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 14
LDI r2, 83
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
