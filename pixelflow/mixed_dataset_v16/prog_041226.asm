; DESCRIPTION: Creates a yellow filled rectangle of size 96x54 starting at (179, 121).
; PLAN: r0=179(x), r1=121(y), r2=96(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 121
LDI r2, 96
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
