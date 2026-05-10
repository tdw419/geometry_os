; DESCRIPTION: Creates a yellow filled rectangle of size 72x103 starting at (149, 68).
; PLAN: r0=149(x), r1=68(y), r2=72(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 68
LDI r2, 72
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
