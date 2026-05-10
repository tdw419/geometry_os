; DESCRIPTION: Creates a yellow filled rectangle of size 26x95 starting at (392, 62).
; PLAN: r0=392(x), r1=62(y), r2=26(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 62
LDI r2, 26
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
